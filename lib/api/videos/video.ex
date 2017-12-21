defmodule Api.Videos.Video do
  use Ecto.Schema
  import Ecto.Changeset

  alias Api.Accounts.{Group, User}
  alias Api.Videos.{Video, VideoSegment, VideoSegmentPlace}


  schema "videos" do
    field :title, :string
    field :description, :string

    # One or the other
    belongs_to :owner_user, User
    belongs_to :owner_group, Group

    has_many :video_segments_places, VideoSegmentPlace
    many_to_many :video_segments, VideoSegment, join_through: VideoSegmentPlace

    timestamps()
  end

  @doc false
  def changeset(%Video{} = video, attrs) do
    video
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
