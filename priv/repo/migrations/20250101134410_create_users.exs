defmodule XClone.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :username, :string
      add :password_hash, :string
      add :name, :string
      add :bio, :text

      timestamps(type: :utc_datetime)
    end

    create unique_index(:users, [:username])
  end
end
