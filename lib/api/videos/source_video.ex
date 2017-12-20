defmodule Api.Videos.SourceVideo do
  use Ecto.Schema
  import Ecto.Changeset
  alias Api.Videos.SourceVideo


  schema "source_videos" do
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(%SourceVideo{} = source_video, attrs) do
    source_video
    |> cast(attrs, [:url])
    |> validate_required([:url])
  end
end
