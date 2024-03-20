defmodule TODO.Repo.Migrations.AddRelationshipTypeToRelationshipTable do
  use Ecto.Migration

  def change do
    alter table(:relationships) do
      add :relationship_type_id, references(:relationship_types, on_delete: :nothing)
    end
  end
end
