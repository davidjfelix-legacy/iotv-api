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

    has_many :video_segment_place_references, VideoSegmentPlace
    has_many :video_references, through: [:video_segment_place_references, :video]

    timestamps()
  end

  @doc false
  def changeset(%VideoSegment{} = video_segment, attrs) do
    video_segment
    |> cast(attrs, [:url])
    |> validate_required([:url])
  end
end
