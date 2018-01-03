defmodule Api.VideoContainers.PlaylistPosition do
    use Ecto.Schema
    import Ecto.Changeset

    alias Api.VideoContainers.{Playlist, PlaylistPosition}
    alias Api.Videos.Video


    @primary_key {:id, Ecto.UUID, autogenerate: true}
    @foreign_key_type Ecto.UUID
    @timestamps_opts [type: :utc_datetime]
    schema "playlist_positions" do
        field :index, :integer

        belongs_to :playlist, Playlist
        belongs_to :video, Video

        timestamps()
    end

    def changeset(%PlaylistPosition{} = playlist_position, attrs) do
        playlist_position
        |> cast(attrs, [:index])
    end
end