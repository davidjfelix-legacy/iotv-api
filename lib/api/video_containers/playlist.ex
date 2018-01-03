defmodule Api.VideoContainers.Playlist do
  use Ecto.Schema
  import Ecto.Changeset

  alias Api.VideoContainers.{Playlist, PlaylistPosition}
  alias Api.Videos.Video

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID
  @timestamps_opts [type: :utc_datetime]
  schema "playlists" do
    field :name, :string

    has_many :playlist_positions, PlaylistPosition
    many_to_many :videos, Video, join_through: PlaylistPosition

    timestamps()
  end

  @doc false
  def changeset(%Playlist{} = playlist, attrs) do
    playlist
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
