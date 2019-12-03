defmodule BitlogWeb.View do
  @moduledoc """
  A DSL to ease the implementation of self-documenting Phoenix Views.
  """

  defmacro doc(name, args) do
    quote do
      Module.put_attribute(__MODULE__, :open_api_spex_schemas, {unquote(name), unquote(args)})
    end
  end

  defmacro __using__(_) do
    quote do
      @before_compile unquote(__MODULE__)
      Module.register_attribute(__MODULE__, :open_api_spex_schemas, accumulate: true)

      use Phoenix.View,
        root: "lib/bitlog_web/templates",
        namespace: BitlogWeb

      # Import convenience functions from controllers
      import Phoenix.Controller, only: [view_module: 1]

      import BitlogWeb.ErrorHelpers
      import BitlogWeb.Gettext
      alias BitlogWeb.Router.Helpers, as: Routes

      import BitlogWeb.OpenApiSpex.SchemaHelpers
      import Plug.Conn
      import unquote(__MODULE__)
    end
  end

  defmacro __before_compile__(env) do
    for {name, schema} <- Module.get_attribute(env.module, :open_api_spex_schemas) do
      quote do
        def schema(unquote(Macro.escape(name))), do: unquote(Macro.escape(schema))
      end
    end
  end
end
