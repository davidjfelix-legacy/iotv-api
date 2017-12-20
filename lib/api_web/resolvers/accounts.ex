defmodule ApiWeb.Resolvers.Accounts do
    def list_users(_parent, _args, _resolution) do
        {:ok, Api.Accounts.list_users}
    end

    def create_user(_parent, args, %{context: %{current_user: %{admin: true}}}) do
        Api.Accounts.create_user(args)
    end
end