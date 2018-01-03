defmodule ApiWeb.Schema.VideoTypes do
    use Absinthe.Schema.Notation
    use Absinthe.Ecto, repo: Api.Repo

    object :source_video do
        field :id, :id
    end

    object :video do
        field :id, :id
        field :title, :string
        field :description, :string

        field :owner_user, :user
        field :owner_group, :group
    end

    object :video_segment do
        field :id, :id

        field :video_stream, :video_stream
        field :source_video, :source_video
    end

    object :video_segment_place do
        field :id, :id
        field :playtime_in_video_ms, :integer
        field :segment_start_offset_ms, :integer
        field :segment_end_offset_ms, :integer
    end

    object :video_stream do
        field :id, :id
    end
end