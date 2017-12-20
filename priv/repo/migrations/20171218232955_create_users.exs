defmodule Api.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :user_name, :string
      add :real_name, :string

      timestamps()
    end

  end
end
