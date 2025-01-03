defmodule XClone.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :content, :text
      add :user_id, references(:users, on_delete: :nothing)
      add :parent_id, references(:posts, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:posts, [:user_id])
    create index(:posts, [:parent_id])
  end
end
