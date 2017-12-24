defmodule ApiWeb.Resolvers.Videos do
    def create_source_video(_parent, source_video, _resolution) do
        Api.Accounts.Videos.create_source_video(source_video)
    end

    def create_video(_parent, video, _resolution) do
        Api.Accounts.Videos.create_video(video)
    end

    def create_video_segment(_parent, video_segment, _resolution) do
        Api.Accounts.Videos.create_video_segment(video_segment)
    end

    def create_video_stream(_parent, video_stream, _resolution) do
        Api.Accounts.Videos.create_video_stream(video_stream)
    end


    def get_source_video(_parent, %{id: id}, _resolution) do
        case Api.Accounts.Videos.get_source_video(id) do
            source_video -> {:ok, source_video}
            nil -> {:error, "Source Video ID #{id} not found"}
        end
    end

    def get_video(_parent, %{id: id}, _resolution) do
        case Api.Accounts.Videos.get_video(id) do
            video -> {:ok, video}
            nil -> {:error, "Video ID #{id} not found"}
        end
    end

    def get_video_segment(_parent, %{id: id}, _resolution) do
        case Api.Accounts.Videos.get_video_segment(id) do
            video_segment -> {:ok, video_segment}
            nil -> {:error, "Video Segment ID #{id} not found"}
        end
    end

    def get_video_stream(_parent, %{id: id}, _resolution) do
        case Api.Accounts.Videos.get_video_stream(id) do
            video_stream -> {:ok, video_stream}
            nil -> {:error, "Video Stream ID #{id} not found"}
        end
    end
end