defmodule ApiWeb.Router do
  use ApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api
    
    forward "/graphiql", Absinthe.Plug.GraphiQL, schema: ApiWeb.Schema
    forward "/graph", Absinthe.Plug, schema: ApiWeb.Schema
  end

end
