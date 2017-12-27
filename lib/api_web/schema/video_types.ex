defmodule ApiWeb.Schema.VideoTypes do
    use Absinthe.Schema.Notation
    use Absinthe.Ecto, repo: Api.Repo

    object :source_video do
        field :id, :id
    end

    object :video do
        field :id, :id
    end

    object :video_segment do
        field :id, :id
    end

    object :video_stream do
        field :id, :id
    end
end