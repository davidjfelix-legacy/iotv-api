defmodule Api.VideoContainers.Playlist do
  use Ecto.Schema
  import Ecto.Changeset
  alias Api.VideoContainers.Playlist


  schema "playlists" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Playlist{} = playlist, attrs) do
    playlist
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
