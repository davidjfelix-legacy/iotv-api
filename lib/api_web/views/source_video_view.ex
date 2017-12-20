defmodule ApiWeb.SourceVideoView do
  use ApiWeb, :view
  alias ApiWeb.SourceVideoView

  def render("index.json", %{source_videos: source_videos}) do
    %{data: render_many(source_videos, SourceVideoView, "source_video.json")}
  end

  def render("show.json", %{source_video: source_video}) do
    %{data: render_one(source_video, SourceVideoView, "source_video.json")}
  end

  def render("source_video.json", %{source_video: source_video}) do
    %{id: source_video.id,
      url: source_video.url}
  end
end
