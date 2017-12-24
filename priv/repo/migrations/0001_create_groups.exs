defmodule Api.Repo.Migrations.CreateGroups do
    use Ecto.Migration

    def change do
        ### Groups
        create table(:groups, primary_key: false) do
            add :id, :uuid, primary_key: true
            add :name, :string, null: false
            
            add :owner_id, references(:users, on_delete: :delete_all, type: :uuid), null: false

            timestamps()
        end


        # Geoups use name as a changable identifier in the API
        create unique_index(:groups, [:name])
        
        ### Group Members
        create table(:group_members, primary_key: false) do
            add :id, :uuid, primary_key: true
            
            add :user_id, references(:users, on_delete: :delete_all, type: :uuid), null: false
            add :group_id, references(:groups, on_delete: :delete_all, type: :uuid), null: false

            timestamps()
        end

        # A user can't have multiple memberships to the same group
        create unique_index(:group_members, [:user_id, :group_id])
    end
end