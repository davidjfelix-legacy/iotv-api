defmodule Api.Videos.SourceVideo do
  use Ecto.Schema
  import Ecto.Changeset

  alias Api.Accounts.{Group, User}
  alias Api.Videos.{SourceVideo, VideoSegment}


  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID
  schema "source_videos" do
    field :url, :string

    belongs_to :owner_user, User
    belongs_to :owner_group, Group

    has_many :video_segments, VideoSegment

    timestamps()
  end

  def changeset(%SourceVideo{} = source_video, attrs) do
    source_video
    |> cast(attrs, [:url])
    |> validate_required([:url])
  end
end
