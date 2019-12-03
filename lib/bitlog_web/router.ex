defmodule BitlogWeb.Router do
  use Phoenix.Router
  import Phoenix.Controller

  pipeline :api do
    plug OpenApiSpex.Plug.PutApiSpec, module: BitlogWeb.OpenApiSpex.Spec
    plug :accepts, ["json"]
  end

  scope "/api", BitlogWeb do
    pipe_through :api
  end

  scope "/openapi" do
    pipe_through :api

    get "/", OpenApiSpex.Plug.RenderSpec, []
  end
end
