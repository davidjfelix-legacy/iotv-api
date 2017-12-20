defmodule Api.Videos.VideoSegment do
  use Ecto.Schema
  import Ecto.Changeset
  alias Api.Videos.VideoSegment


  schema "video_segments" do
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(%VideoSegment{} = video_segment, attrs) do
    video_segment
    |> cast(attrs, [:url])
    |> validate_required([:url])
  end
end
