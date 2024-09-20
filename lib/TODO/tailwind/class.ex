defmodule TODO.Tailwind.Class do
  use Ecto.Schema
  import Ecto.Changeset

  schema "class" do
    field :name, :string
    field :text, :string
    field :example, :string
    field :elem, :string
    field :label, :string
    field :body, :string


    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(class, attrs) do
    class
    |> cast(attrs, [:name, :text, :example, :elem, :label, :body])
    # |> validate_required([:name, :text, :example, :elem, :label])
  end
end
