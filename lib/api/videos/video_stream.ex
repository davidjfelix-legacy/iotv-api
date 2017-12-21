defmodule Api.Videos.VideoStream do
  use Ecto.Schema
  import Ecto.Changeset
  
  alias Api.Videos.VideoStream


  schema "video_streams" do
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(%VideoStream{} = video_stream, attrs) do
    video_stream
    |> cast(attrs, [:url])
    |> validate_required([:url])
  end
end
