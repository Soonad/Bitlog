defmodule Bitlog.Repo do
  use Ecto.Repo,
    otp_app: :bitlog,
    adapter: Ecto.Adapters.Postgres
end
