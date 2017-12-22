defmodule Api.VideoContainers.PlaylistPosition do
    use Ecto.Schema
    import Ecto.Changeset

    alias Api.VideoContainers.{Playlist, PlaylistPosition}
    alias Api.Videos.Video


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