defmodule TODOWeb.UploaderLive do
  use TODOWeb, :live_view
  alias TODO.Repo
  alias TODO.Documents.Upload
  alias TODOWeb.CoreComponents

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    {:ok,
    socket
    |> assign(:uploaded_files, Repo.all(Upload))
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

  @impl Phoenix.LiveView
  def handle_event("save", _params, socket) do
    client_name = get_file_info(socket, :client_name)
    client_size = get_file_info(socket, :client_size)
    client_type = get_file_info(socket, :client_type)

    uploaded_files =
      consume_uploaded_entries(socket, :avatar, fn %{path: path}, _entry ->
        content = File.read!(path)

        {:ok, _upload} =
          %Upload{}
            |> Upload.changeset(%{
              filename: client_name,
              content_type: client_type,
              size: client_size,
              content: content
            })
            |> Repo.insert()
      end)

    {:noreply, update(socket, :uploaded_files, &(&1 ++ uploaded_files))}
  end

  # defp error_to_string(:too_large), do: "Too large"
  # defp error_to_string(:too_many_files), do: "You have selected too many files"
  # defp error_to_string(:not_accepted), do: "You have selected an unacceptable file type"

  defp get_file_info(socket, atom) do
    socket.assigns.uploads
    |> Map.get(:avatar)
    |> Map.from_struct()
    |> Map.get(:entries)
    |> hd
    |> Map.from_struct()
    |> Map.get(atom)
  end
end
