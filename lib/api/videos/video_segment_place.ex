defmodule Api.Videos.VideoSegmentPlace do
    use Ecto.Schema
    import Ecto.Changeset

    alias Api.Videos.{VideoSegment, VideoSegmentPlace}


    @primary_key {:id, Ecto.UUID, autogenerate: true}
    schema "videos" do
        field :url, :string
        field :playtime_in_video_ms, :string
        field :segment_start_offset_ms, :string
        field :segment_end_offset_ms, :string

        # One of these created the segment
        has_one :video_stream, VideoStream
        has_one :video_source, VideoSource

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