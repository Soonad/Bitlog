import Config

config :bitlog,
  ecto_repos: [Bitlog.Repo]

config :bitlog, Bitlog.Repo, migration_primary_key: [name: :id, type: :binary_id]

# Configures the endpoint
config :bitlog, BitlogWeb.Endpoint, render_errors: [view: BitlogWeb.ErrorView, accepts: ~w(json)]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason
