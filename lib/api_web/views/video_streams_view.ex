defmodule ApiWeb.VideoStreamsView do
  use ApiWeb, :view
  alias ApiWeb.VideoStreamsView

  def render("index.json", %{video_streams: video_streams}) do
    %{data: render_many(video_streams, VideoStreamsView, "video_streams.json")}
  end

  def render("show.json", %{video_streams: video_streams}) do
    %{data: render_one(video_streams, VideoStreamsView, "video_streams.json")}
  end

  def render("video_streams.json", %{video_streams: video_streams}) do
    %{id: video_streams.id,
      url: video_streams.url}
  end
end
