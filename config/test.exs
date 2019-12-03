import Config

config :bitlog, Bitlog.Repo, pool: Ecto.Adapters.SQL.Sandbox
config :bitlog, BitlogWeb.Endpoint, server: false
config :logger, level: :warn
