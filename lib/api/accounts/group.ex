defmodule Api.Accounts.Group do
  use Ecto.Schema
  import Ecto.Changeset

  alias Api.Accounts.{Group, User}


  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID
  schema "groups" do
    field :name, :string

    belongs_to :owner, User

    many_to_many :members, User, join_through: "group_members"

    timestamps()
  end

  @doc false
  def changeset(%Group{} = group, attrs) do
    group
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
