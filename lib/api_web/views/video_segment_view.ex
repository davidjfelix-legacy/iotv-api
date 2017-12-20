defmodule ApiWeb.VideoSegmentView do
  use ApiWeb, :view
  alias ApiWeb.VideoSegmentView

  def render("index.json", %{video_segments: video_segments}) do
    %{data: render_many(video_segments, VideoSegmentView, "video_segment.json")}
  end

  def render("show.json", %{video_segment: video_segment}) do
    %{data: render_one(video_segment, VideoSegmentView, "video_segment.json")}
  end

  def render("video_segment.json", %{video_segment: video_segment}) do
    %{id: video_segment.id,
      url: video_segment.url}
  end
end
