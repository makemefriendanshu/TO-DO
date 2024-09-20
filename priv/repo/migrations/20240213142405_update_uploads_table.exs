defmodule TODO.Repo.Migrations.UpdateUploadsTable do
  use Ecto.Migration

  def change do
    alter table(:uploads) do
      add :content, :binary
    end
  end
end
