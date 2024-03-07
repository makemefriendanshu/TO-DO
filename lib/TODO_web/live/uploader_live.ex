defmodule TODOWeb.UploaderLive do
  use TODOWeb, :live_view
  alias TODO.Repo
  alias TODO.Documents.Upload
  alias TODOWeb.Service
  alias TODOWeb.Presence
  alias Phoenix.LiveView.JS

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    if connected?(socket) do
      Phoenix.PubSub.subscribe(TODO.PubSub, "upload")
      |> IO.inspect(label: "subscribe")
      {:ok, _ref} = Presence.track(self(), "upload", "upload_key", %{}) |> IO.inspect(label: "track")
    end

    {:ok,
     socket
     |> assign(:uploaded_files, Upload |> Repo.all() |> Repo.preload(:user))
     |> assign(:live_users, get_live_users_count()|> IO.inspect(label: "count"))
     |> allow_upload(:avatar, accept: :any, max_entries: 1)}
  end

  @impl Phoenix.LiveView
  def handle_event("validate", _params, socket) do
    {:noreply, socket}
  end

  @impl Phoenix.LiveView
  def handle_event("cancel-upload", %{"ref" => ref}, socket) do
    {:noreply, cancel_upload(socket, :avatar, ref)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    upload = Repo.get!(Upload, id)

    if is_nil(socket.assigns.current_user) ||
         (socket.assigns.current_user |> Map.from_struct() |> Map.get(:id) != upload.user_id and
            not is_nil(upload.user_id)) do
      {:noreply, socket |> put_flash(:error, "No permission to delete upload")}
    else
      {:ok, _} = Repo.delete(upload)
      {:noreply, update(socket, :uploaded_files, &Enum.filter(&1, fn x -> x.id != upload.id end))}
    end
  end

  @impl Phoenix.LiveView
  def handle_event("save", _params, socket) do
    if Service.has_no_uploads(socket) do
      {:noreply, socket}
    else
      client_name = Service.get_file_info(socket, :client_name)
      client_size = Service.get_file_info(socket, :client_size)
      client_type = Service.get_file_info(socket, :client_type)

      uploaded_files =
        consume_uploaded_entries(socket, :avatar, fn %{path: path}, _entry ->
          content = File.read!(path)

          upload =
            %Upload{}
            |> Upload.changeset(%{
              filename: client_name,
              content_type: client_type,
              size: client_size,
              content: content,
              user_id:
                if is_nil(socket.assigns.current_user) do
                  nil
                else
                  socket.assigns.current_user
                  |> Map.from_struct()
                  |> Map.get(:id)
                end
            })
            |> Repo.insert!()

          if not Map.has_key?(socket.assigns, :current_user) ||
               is_nil(socket.assigns.current_user) do
            {:ok, upload}
          else
            {:ok,
             upload
             |> Repo.preload(:user)}
          end
        end)

      {:noreply, update(socket, :uploaded_files, &(&1 ++ uploaded_files))}
    end
  end

  defp get_live_users_count() do
    case Presence.list("upload") do
      %{"upload_key" => %{metas: list}} -> Enum.count(list)
      _other -> 0
    end
  end

  def toggle_tab(js \\ %JS{}, index) do
    index =
    index
    |> Integer.to_string
    |> IO.inspect(label: "index")

    js
    |> IO.inspect(label: "js")
    |> JS.hide(to: ".tab-content")
    |> JS.show(to: "#tab-content-#{index}")
    |> JS.remove_class("active", to: ".active.tab-button")
    |> JS.add_class("active", to: "#tab-button-#{index}")
    |> IO.inspect(label: "js-2")
  end
end
