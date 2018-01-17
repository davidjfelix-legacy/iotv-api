defmodule ApiWeb.Router do
  use ApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/info" do
    get "/health", ApiWeb.InfoController, :health
  end

  scope "/" do
    pipe_through :api

    forward "/graphiql",
      Absinthe.Plug.GraphiQL,
        schema: ApiWeb.Schema,
        interface: :playground,
        default_url: "http://localhost:4000/graph",
        socket_url: "'ws://localhost:4000/socket'"
    forward "/graph", Absinthe.Plug, schema: ApiWeb.Schema
  end

end
