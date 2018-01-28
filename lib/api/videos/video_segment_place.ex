defmodule Api.Videos.VideoSegmentPlace do
  use Ecto.Schema
  import Ecto.Changeset

  alias Api.Videos.{Video, VideoSegment, VideoSegmentPlace}


  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID
  @timestamps_opts [type: :utc_datetime]
  schema "video_segment_place" do
    field :playtime_in_video_ms, :integer
    field :segment_start_offset_ms, :integer
    field :segment_end_offset_ms, :integer

    belongs_to :video_segment, VideoSegment
    belongs_to :video, Video

    timestamps()
  end

  def changeset(%VideoSegmentPlace{} = video_segment_place, attrs) do
    video_segment_place
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end