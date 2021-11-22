defmodule Almalia.Repo do
  use Ecto.Repo,
    otp_app: :almalia,
    adapter: Ecto.Adapters.Postgres
end
