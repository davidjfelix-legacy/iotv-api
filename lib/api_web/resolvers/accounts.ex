defmodule ApiWeb.Resolvers.Accounts do

    def create_group(_parent, args, _resolution) do
        Api.Accounts.create_group(args)
    end

    def create_user(_parent, args, _resololution) do
        Api.Accounts.create_user(args)
    end


    def find_group(_parent, args, _resolution) do
        case Api.Accounts.find_group(args) do
            nil -> {:error, "No group matching those parameters could be found"}
            group -> {:ok, group}
        end
    end

    def find_user(_parent, args, _resolution) do
        case Api.Accounts.find_user(args) do
            nil -> {:error, "No user matching those parameters could be found"}
            user -> {:ok, user}
        end
    end


    def get_group(_parent, %{id: id}, _resolution) do
        case Api.Accounts.get_group(id) do
            nil -> {:error, "Group ID #{id} not found"}
            group -> {:ok, group}
        end
    end

    def get_user(_parent, %{id: id}, _resolution) do
        case Api.Accounts.get_user(id) do
            nil -> {:error, "User ID #{id} not found"}
            user -> {:ok, user}
        end
    end


    def list_groups(_parent, _args, _resolution) do
        {:ok, Api.Accounts.list_groups()}
    end

    def list_users(_parent, _args, _resolution) do
        {:ok, Api.Accounts.list_users()}
    end
end