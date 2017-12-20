defmodule Api.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Api.Accounts.User


  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID
  @derive {Poison.Encoder, only: [:id, :user_name, :email, :real_name]}
  schema "users" do
    field :email, :string
    field :real_name, :string
    field :user_name, :string
    
    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email, :user_name, :real_name])
    |> validate_required([:email, :user_name, :real_name])
  end
end
