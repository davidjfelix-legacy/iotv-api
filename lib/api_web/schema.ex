defmodule ApiWeb.Schema do
    use Absinthe.Schema

    import_types Absinthe.Type.Custom
    import_types ApiWeb.Schema.AccountTypes
    import_types ApiWeb.Schema.VideoContainerTypes
    import_types ApiWeb.Schema.VideoTypes

    alias ApiWeb.Resolvers

    query do
        field :find_group, :group do
            arg :name, :string
        end

        field :find_user, :user do
            arg :user_name, :string
            arg :real_name, :string
            arg :email, :string

            resolve &Resolvers.Accounts.find_user/3
        end

        field :group, :group do
            arg :id, non_null(:id)

            resolve &Resolvers.Accounts.get_group/3
        end

        field :groups, list_of(:group) do

            resolve &Resolvers.Accounts.list_groups/3
        end

        field :source_video, :source_video do
            arg :id, non_null(:string)

            resolve &Resolvers.Videos.get_source_video/3
        end

        field :user, :user do
            arg :id, non_null(:id)

            resolve &Resolvers.Accounts.get_user/3
        end

        field :users, list_of(:user) do

            resolve &Resolvers.Accounts.list_users/3
        end

        field :video, :video do
            arg :id, non_null(:id)

            resolve &Resolvers.Videos.get_video/3
        end

        field :video_segment, :video_segment do
            arg :id, non_null(:id)

            resolve &Resolvers.Videos.get_video_segment/3
        end

        field :video_stream, :video_stream do
            arg :id, non_null(:id)

            resolve &Resolvers.Videos.get_video_stream/3
        end
    end

    mutation do
        field :create_source_video, :source_video do
            arg :url, non_null(:string)
            arg :owner_user_id, :id
            arg :owner_group_id, :id

            resolve &Resolvers.Videos.create_source_video/3
        end

        field :create_user, :user do
            arg :email, non_null(:string)
            arg :user_name, non_null(:string)
            arg :real_name, :string

            resolve &Resolvers.Accounts.create_user/3
        end

        field :create_video, :video do
            arg :title, :string
            arg :description, :string

            resolve &Resolvers.Videos.create_video/3
        end
    end

    subscription do
        field :group_updated, :user do
            arg :id, non_null(:id)

            config fn args, _ ->
                {:ok, topic: args.id}
            end
        end

        field :performance_updated, :user do
            arg :id, non_null(:id)

            config fn args, _ ->
                {:ok, topic: args.id}
            end
        end

        field :platlist_updated, :user do
            arg :id, non_null(:id)

            config fn args, _ ->
                {:ok, topic: args.id}
            end
        end

        field :series_updated, :user do
            arg :id, non_null(:id)

            config fn args, _ ->
                {:ok, topic: args.id}
            end
        end

        field :user_updated, :user do
            arg :id, non_null(:id)

            config fn args, _ ->
                {:ok, topic: args.id}
            end
        end

        field :video_updated, :user do
            arg :id, non_null(:id)

            config fn args, _ ->
                {:ok, topic: args.id}
            end
        end 
    end
end