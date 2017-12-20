defmodule ApiWeb.VideoStreamView do
  use ApiWeb, :view
  alias ApiWeb.VideoStreamView

  def render("index.json", %{video_streams: video_streams}) do
    %{data: render_many(video_streams, VideoStreamView, "video_stream.json")}
  end

  def render("show.json", %{video_stream: video_stream}) do
    %{data: render_one(video_stream, VideoStreamView, "video_stream.json")}
  end

  def render("video_stream.json", %{video_stream: video_stream}) do
    %{id: video_stream.id,
      url: video_stream.url}
  end
end
