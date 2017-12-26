defmodule ApiWeb.Resolvers.Accounts do
    def list_users(_parent, _args, _resolution) do
        {:ok, Api.Accounts.list_users()}
    end

    def list_groups(_parent, _args, _resolution) do
        {:ok, Api.Accounts.list_groups()}
    end

    def create_user(_parent, args, _resololution) do
        Api.Accounts.create_user(args)
    end
end