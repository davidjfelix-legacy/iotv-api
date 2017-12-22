defmodule Api.Videos.VideoSegment do
  use Ecto.Schema
  import Ecto.Changeset

  alias Api.Videos.{SourceVideo, Video, VideoSegment, VideoSegmentPlace, VideoStream}


  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID
  schema "video_segments" do
    field :url, :string

    belongs_to :video_stream, VideoStream
    belongs_to :source_video, SourceVideo

    many_to_many :video_references, Video, join_through: VideoSegmentPlace

    timestamps()
  end

  @doc false
  def changeset(%VideoSegment{} = video_segment, attrs) do
    video_segment
    |> cast(attrs, [:url])
    |> validate_required([:url])
  end
end
