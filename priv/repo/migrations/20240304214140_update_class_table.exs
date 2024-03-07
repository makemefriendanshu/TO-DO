defmodule TODO.Repo.Migrations.UpdateClassTable do
  use Ecto.Migration

  def change do
    alter table(:class) do
      add :elem, :text
      add :label, :text
      add :body, :text
    end
  end
end
