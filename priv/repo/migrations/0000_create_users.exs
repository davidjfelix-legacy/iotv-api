defmodule Api.Repo.Migrations.CreateUsers do
    use Ecto.Migration

    def change do
        ### Users
        create table(:users, primary_key: false) do
            add :id, :uuid, primary_key: true
            add :email, :string, null: false
            add :real_name, :string
            add :user_name, :string, null: false
            add :is_email_confirmed, :boolean, null: false

            timestamps()
        end

        # Users use username as a changeable identifier in the API
        create unique_index(:users, [:user_name])

        # Users must have unqie emails to discourage multi-accounts
        create unique_index(:users, [:email])
    end
end