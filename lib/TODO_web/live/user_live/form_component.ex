defmodule TODOWeb.UserLive.FormComponent do
  use TODOWeb, :live_component

  alias TODO.Repo
  alias TODO.Accounts
  alias TODOWeb.Service

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <:subtitle>Use this form to manage user records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="user-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:name]} type="text" label="Name" />
        <.input field={@form[:email]} type="email" label="Email" />
        <.input field={@form[:password]} type="password" label="Password" />
        <.input field={@form[:is_admin]} type="checkbox" label="Is admin" />
        <.input field={@form[:confirmed_at]} type="datetime-local" label="Confirmed at" />
        <div>
          <Phoenix.Component.live_file_input upload={@uploads.avatar} class="text-black bg-blue-400 dark:bg-blue-500 sfont-medium rounded-lg text-sm px-5 py-2.5 text-center"/>
        </div>
        <:actions>
          <.button phx-disable-with="Saving...">Save User</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{user: user} = assigns, socket) do
    changeset = Accounts.change_user(user)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)
     |> allow_upload(:avatar,
       accept: ~w(.jpg .jpeg),
       max_entries: 1
     )}
  end

  @impl true
  def handle_event("validate", %{"user" => user_params}, socket) do
    changeset =
      socket.assigns.user
      |> Accounts.change_user(user_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"user" => user_params}, socket) do
    save_user(socket, socket.assigns.action, user_params)
  end

  defp save_user(socket, :edit, user_params) do
    param =
      if Service.has_no_uploads(socket) do
        []
      else
        client_name = Service.get_file_info(socket, :client_name)
        client_size = Service.get_file_info(socket, :client_size)
        client_type = Service.get_file_info(socket, :client_type)

        consume_uploaded_entries(socket, :avatar, fn %{path: path}, _entry ->
          content = File.read!(path)

          {:ok,
          %{
             filename: client_name,
             content_type: client_type,
              size: client_size,
              content: content,
              user_id:
                  socket.assigns.current_user
                  |> Map.from_struct()
                  |> Map.get(:id)
          }}
        end)
      end

    user =
      socket.assigns.user
      |> Repo.preload(:avatar)

    user_changeset =
      user |> Accounts.change_user(user_params)


    user_with_avatar =
      Ecto.Changeset.put_assoc(user_changeset, :avatar, hd(param))

    case Repo.update(user_with_avatar) do
      {:ok, user} ->
        notify_parent({:saved, user})

        {:noreply,
         socket
         |> put_flash(:info, "User updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_user(socket, :new, user_params) do
    case Accounts.create_user(user_params) do
      {:ok, user} ->
        notify_parent({:saved, user})

        {:noreply,
         socket
         |> put_flash(:info, "User created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
