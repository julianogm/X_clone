defmodule XClone.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :username, :string
    field :email, :string
    field :password_hash, :string
    field :bio, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :username, :password_hash, :name, :bio])
    |> validate_required([:email, :username, :password_hash, :name, :bio])
    |> unique_constraint(:username)
  end
end
