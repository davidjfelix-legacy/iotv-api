defmodule ApiWeb.Resolvers.Videos do
    def create_source_video(_parent, source_video, _resolution) do
        Api.Videos.create_source_video(source_video)
    end

    def create_video(_parent, video, _resolution) do
        Api.Videos.create_video(video)
    end

    def create_video_segment(_parent, video_segment, _resolution) do
        Api.Videos.create_video_segment(video_segment)
    end

    def create_video_stream(_parent, video_stream, _resolution) do
        Api.Videos.create_video_stream(video_stream)
    end


    def get_source_video(_parent, %{id: id}, _resolution) do
        case Api.Videos.get_source_video(id) do
            nil -> {:error, "Source Video ID #{id} not found"}
            source_video -> {:ok, source_video}
        end
    end

    def get_video(_parent, %{id: id}, _resolution) do
        case Api.Videos.get_video(id) do
            nil -> {:error, "Video ID #{id} not found"}
            video -> {:ok, video}
        end
    end

    def get_video_segment(_parent, %{id: id}, _resolution) do
        case Api.Videos.get_video_segment(id) do
            nil -> {:error, "Video Segment ID #{id} not found"}
            video_segment -> {:ok, video_segment}
        end
    end

    def get_video_stream(_parent, %{id: id}, _resolution) do
        case Api.Videos.get_video_stream(id) do
            nil -> {:error, "Video Stream ID #{id} not found"}
            video_stream -> {:ok, video_stream}
        end
    end
end