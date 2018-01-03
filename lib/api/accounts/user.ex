defmodule Api.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Api.Accounts.{Group, User}
  alias Api.Videos.Video


  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID
  @timestamps_opts [type: :utc_datetime]
  @derive {Poison.Encoder, only: [:id, :user_name, :email, :real_name]}
  schema "users" do
    field :email, :string
    field :is_email_confirmed, :boolean, default: false
    field :real_name, :string
    field :user_name, :string

    has_many :owned_groups, Group, foreign_key: :owner_id
    has_many :videos, Video, foreign_key: :owner_user_id

    many_to_many :groups, Group, join_through: "group_members"

    timestamps()
  end

  @allowed_fields ~w(email real_name user_name)a
  @required_fields ~w(email user_name)a

  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, @allowed_fields)
    |> validate_required(@required_fields)
    |> unique_constraint(:email)
    |> unique_constraint(:user_name)
  end
end
