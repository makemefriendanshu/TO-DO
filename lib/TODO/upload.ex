defmodule TODO.Documents.Upload do
  use Ecto.Schema
  import Ecto.Changeset

  schema "uploads" do
    field :size, :integer
    field :filename, :string
    field :content_type, :string
    field :content, :binary

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(upload, attrs) do
    upload
    |> cast(attrs, [:filename, :size, :content_type, :content])
    |> validate_required([:filename, :size, :content_type])
    |> validate_number(:size, greater_than: 0)
  end

  def upload_directory do
    Application.get_env(:todo, :uploads_directory)
  end

  def local_path(id, filename) do
    [upload_directory(), "#{id}-#{filename}"]
    |> Path.join()
  end
end
