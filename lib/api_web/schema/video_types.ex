defmodule ApiWeb.Schema.VideoTypes do
    use Absinthe.Schema.Notation

    object :source_video do
        field :id, :id
    end

    object :video_segment do
        field :id, :id
    end

    object :video_stream do
        field :id, :id
    end
end