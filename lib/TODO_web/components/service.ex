defmodule TODOWeb.Service do
  def get_file_info(socket, atom) do
    socket.assigns.uploads
    |> Map.get(:avatar)
    |> Map.from_struct()
    |> Map.get(:entries)
    |> hd
    |> Map.from_struct()
    |> Map.get(atom)
  end

  def has_no_uploads(socket) do
    socket.assigns.uploads
    |> Map.get(:avatar)
    |> Map.from_struct()
    |> Map.get(:entries) == []
  end
end
