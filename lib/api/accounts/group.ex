defmodule Api.Accounts.Group do
  use Ecto.Schema
  import Ecto.Changeset
  alias Api.Accounts.Group


  schema "groups" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Group{} = group, attrs) do
    group
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
