defmodule Api.Videos do
  import Ecto.Query, warn: false
  alias Api.Repo

  alias Api.Videos.{SourceVideo, Video, VideoSegment, VideoStream}


  def change_source_video(%SourceVideo{} = source_video) do
    SourceVideo.changeset(source_video, %{})
  end

  def change_video(%Video{} = video) do
    Video.changeset(video, %{})
  end

  def change_video_segment(%VideoSegment{} = video_segment) do
    VideoSegment.changeset(video_segment, %{})
  end

  def change_video_stream(%VideoStream{} = video_stream) do
    VideoStream.changeset(video_stream, %{})
  end


  def create_source_video(attrs \\ %{}) do
    %SourceVideo{}
    |> SourceVideo.changeset(attrs)
    |> Repo.insert()
  end

  def create_video(attrs \\ %{}) do
    %Video{}
    |> Video.changeset(attrs)
    |> Repo.insert()
  end

  def create_video_segment(attrs \\ %{}) do
    %VideoSegment{}
    |> VideoSegment.changeset(attrs)
    |> Repo.insert()
  end

  def create_video_stream(attrs \\ %{}) do
    %VideoStream{}
    |> VideoStream.changeset(attrs)
    |> Repo.insert()
  end


  def delete_source_video(%SourceVideo{} = source_video) do
    Repo.delete(source_video)
  end

  def delete_video(%Video{} = video) do
    Repo.delete(video)
  end

  def delete_video_segment(%VideoSegment{} = video_segment) do
    Repo.delete(video_segment)
  end

  def delete_video_stream(%VideoStream{} = video_stream) do
    Repo.delete(video_stream)
  end


  def get_source_video(id), do: Repo.get(SourceVideo, id)

  def get_video(id), do: Repo.get(Video, id)

  def get_video_segment(id), do: Repo.get(VideoSegment, id)

  def get_video_stream(id), do: Repo.get(VideoStream, id)

  
  def list_source_videos, do: Repo.all(SourceVideo)

  def list_videos, do: Repo.all(Video)

  def list_video_segments, do: Repo.all(VideoSegment)

  def list_video_streams, do: Repo.all(VideoStream)



  def update_source_video(%SourceVideo{} = source_video, attrs) do
    source_video
    |> SourceVideo.changeset(attrs)
    |> Repo.update()
  end

  def update_video(%Video{} = video, attrs) do
    video
    |> Video.changeset(attrs)
    |> Repo.update()
  end

  def update_video_segment(%VideoSegment{} = video_segment, attrs) do
    video_segment
    |> VideoSegment.changeset(attrs)
    |> Repo.update()
  end

  def update_video_stream(%VideoStream{} = video_stream, attrs) do
    video_stream
    |> VideoStream.changeset(attrs)
    |> Repo.update()
  end
end
