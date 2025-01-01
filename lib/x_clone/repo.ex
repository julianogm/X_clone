defmodule XClone.Repo do
  use Ecto.Repo,
    otp_app: :x_clone,
    adapter: Ecto.Adapters.Postgres
end
