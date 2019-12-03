import Config
import BitlogEnv

config :bitlog, Bitlog.Repo,
  url: get_str("DATABASE_URL"),
  pool_size: get_int("DATABASE_POOL_SIZE")

config :bitlog, BitlogWeb.Endpoint,
  http: [port: get_int("PORT")],
  url: [
    host: get_str("PUBLIC_HOST"),
    path: get_str("PUBLIC_PATH"),
    port: get_int("PUBLIC_PORT"),
    scheme: get_str("PUBLIC_SCHEME")
  ]
