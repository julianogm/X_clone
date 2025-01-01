defmodule XClone.Timeline.Like do
  use Ecto.Schema
  import Ecto.Changeset

  schema "likes" do

    field :user_id, :id
    field :post_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(like, attrs) do
    like
    |> cast(attrs, [])
    |> validate_required([])
  end
end
