defmodule TODO.Repo.Migrations.UpdateUploadsTableAddUserIdColumn do
  use Ecto.Migration

  def change do
    alter table(:uploads) do
      add :user_id, references(:users)
    end
  end
end
