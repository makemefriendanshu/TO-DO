defmodule TODO.Accounts.Relationship do
  use Ecto.Schema
  import Ecto.Changeset

  alias TODO.Accounts.User
  alias TODO.Accounts.RelationshipType

  schema "relationships" do
    belongs_to(:follower, User)
    belongs_to(:followed, User)
    belongs_to(:relationship_type, RelationshipType)

    timestamps()
  end

  @doc false
  def changeset(%__MODULE__{} = relationship \\ __MODULE__, attrs) do
    relationship
    |> cast(attrs, [:follower_id, :followed_id, :relationship_type])
    |> validate_required([:follower_id, :followed_id])
    |> foreign_key_constraint(:follower_id)
    |> foreign_key_constraint(:followed_id)
    |> foreign_key_constraint(:relationship_type)
  end
end
