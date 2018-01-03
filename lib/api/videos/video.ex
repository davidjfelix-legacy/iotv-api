defmodule Api.Videos.Video do
  use Ecto.Schema
  import Ecto.Changeset

  alias Api.Accounts.{Group, User}
  alias Api.Videos.{Video, VideoSegmentPlace}


  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID
  @timestamps_opts [type: :utc_datetime]
  schema "videos" do
    field :title, :string
    field :description, :string

    # One or the other
    belongs_to :owner_user, User
    belongs_to :owner_group, Group

    has_many :video_segments_places, VideoSegmentPlace
    has_many :video_segments, through: [:video_segments_places, :video_segment]

    timestamps()
  end

  @doc false
  def changeset(%Video{} = video, attrs) do
    video
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
