defmodule TODO.Repo.Migrations.AddAvatarColumnInUserTable do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :avatar, references(:uploads)
    end
  end
end
