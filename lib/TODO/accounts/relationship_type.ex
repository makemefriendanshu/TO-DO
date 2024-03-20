defmodule TODO.Accounts.RelationshipType do
  use Ecto.Schema
  import Ecto.Changeset

  schema "relationship_types" do
    field :name, :string
    field :type, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(relationship_type, attrs) do
    relationship_type
    |> cast(attrs, [:name, :type])
    |> validate_required([:name, :type])
  end
end
