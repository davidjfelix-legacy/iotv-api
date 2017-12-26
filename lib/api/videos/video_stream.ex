defmodule Api.Videos.VideoStream do
  use Ecto.Schema
  import Ecto.Changeset

  alias Api.Videos.{VideoSegment, VideoStream}


  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID
  schema "video_streams" do
    belongs_to :owner_user, User
    belongs_to :owner_group, Group

    has_many :video_segments, VideoSegment

    timestamps()
  end

  @doc false
  def changeset(%VideoStream{} = video_stream, attrs) do
    video_stream
    |> cast(attrs, [:url])
    |> validate_required([:url])
  end
end
