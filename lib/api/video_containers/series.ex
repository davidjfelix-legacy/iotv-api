defmodule Api.VideoContainers.Series do
  use Ecto.Schema
  import Ecto.Changeset
  alias Api.VideoContainers.Series


  schema "series" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Series{} = series, attrs) do
    series
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
