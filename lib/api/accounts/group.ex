defmodule Api.Accounts.Group do
  use Ecto.Schema
  import Ecto.Changeset

  alias Api.Accounts.{Group, User}


  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID
  @timestamps_opts [type: :utc_datetime]
  schema "groups" do
    field :name, :string

    belongs_to :owner, User

    many_to_many :members, User, join_through: "group_members"

    timestamps()
  end

  @allowed_fields ~w(name owner_id)a
  @required_fields ~w(name owner_id)a

  def changeset(%Group{} = group, attrs) do
    group
    |> cast(attrs, @allowed_fields)
    |> validate_required(@required_fields)
    |> unique_constraint(:name)
  end
end
