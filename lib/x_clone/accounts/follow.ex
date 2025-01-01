defmodule XClone.Accounts.Follow do
  use Ecto.Schema
  import Ecto.Changeset

  schema "follows" do

    field :follower_id, :id
    field :followed_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(follow, attrs) do
    follow
    |> cast(attrs, [])
    |> validate_required([])
  end
end
