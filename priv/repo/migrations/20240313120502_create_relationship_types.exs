defmodule TODO.Repo.Migrations.CreateRelationshipTypes do
  use Ecto.Migration

  def change do
    create table(:relationship_types) do
      add :name, :string
      add :type, :string

      timestamps(type: :utc_datetime)
    end
  end
end
