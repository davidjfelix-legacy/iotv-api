defmodule Api.Videos.Video do
  use Ecto.Schema
  import Ecto.Changeset
  alias Api.Videos.Video


  schema "videos" do
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(%Video{} = video, attrs) do
    video
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
