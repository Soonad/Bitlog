defmodule BitlogWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :bitlog

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    plug Phoenix.CodeReloader
  end

  plug Bitlog.LivenessPlug
  plug Bitlog.ReadinessPlug

  plug CORSPlug, expose: ["Location"]

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug BitlogWeb.Router
end
