defmodule Api.VideoContainers.Performance do
  use Ecto.Schema
  import Ecto.Changeset

  alias Api.VideoContainers.Performance


  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID
  @timestamps_opts [type: :utc_datetime]
  schema "performances" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Performance{} = performance, attrs) do
    performance
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
