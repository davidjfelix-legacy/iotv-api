defmodule Api.VideoContainers.Performance do
  use Ecto.Schema
  import Ecto.Changeset
  alias Api.VideoContainers.Performance


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
