defmodule ApiWeb.Schema do
    use Absinthe.Schema

    import_types Absinthe.Type.Custom
    import_types ApiWeb.Schema.AccountTypes
    import_types ApiWeb.Schema.VideoContainerTypes
    import_types ApiWeb.Schema.VideoTypes

    alias ApiWeb.Resolvers

    query do
        field :users, list_of(:user) do
            resolve &Resolvers.Accounts.list_users/3
        end
    end

    mutation do
        field :create_user, :user do
            arg :email, non_null(:string)

            resolve &Resolvers.Accounts.create_user/3
        end
    end
end