defmodule TODO.Repo.Migrations.UpdateUploadsTableDropHash do
  use Ecto.Migration

  def change do
    alter table(:uploads) do
      remove :hash
    end
  end
end
