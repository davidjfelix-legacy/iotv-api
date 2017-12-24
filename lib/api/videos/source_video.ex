defmodule Api.Videos.SourceVideo do
  use Ecto.Schema
  import Ecto.Changeset

  alias Api.Accounts.{Group, User}
  alias Api.Videos.SourceVideo


  schema "source_videos" do
    field :url, :string

    belongs_to :owner_user, User
    belongs_to :owner_group, Group

    timestamps()
  end

  @doc false
  def changeset(%SourceVideo{} = source_video, attrs) do
    source_video
    |> cast(attrs, [:url])
    |> validate_required([:url])
  end
end
