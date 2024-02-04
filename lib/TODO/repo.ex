defmodule TODO.Repo do
  use Ecto.Repo,
    otp_app: :TODO,
    adapter: Ecto.Adapters.Postgres
end
