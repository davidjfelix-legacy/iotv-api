defmodule ApiWeb.Router do
  use ApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug :cors
  end

  scope "/info" do
    get "/health", ApiWeb.InfoController, :health
  end

  scope "/" do
    pipe_through :api

    options "/graphiql", ApiWeb.OptionsController, :send_options
    forward "/graphiql",
      Absinthe.Plug.GraphiQL,
        schema: ApiWeb.Schema,
        interface: :playground,
        default_url: "http://localhost:4000/graph",
        socket_url: "'ws://localhost:4000/socket'"
    options "/graph", ApiWeb.OptionsController, :send_options
    forward "/graph", Absinthe.Plug, schema: ApiWeb.Schema
  end

  defp cors(conn, _) do
    conn
    |> put_resp_header("Access-Control-Allow-Origin", "*")
    |> put_resp_header("Access-Control-Allow-Headers", "content-type, credentials, x-apollo-tracing")
  end
end
