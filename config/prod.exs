import Config

config :bitlog, BitlogWeb.Endpoint, server: true

config :bitlog, Bitlog.Repo,
  show_sensitive_data_on_connection_error: false,
  ssl: true

config :logger, level: :info
