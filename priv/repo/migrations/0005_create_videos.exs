defmodule Api.Repo.Migrations.CreateVideos do
    use Ecto.Migration

    def change do
        ### Videos
        create table(:videos, primary_key: false) do
            add :id, :uuid, primary_key: true
            add :description, :string
            add :title, :string

            add :owner_group_id, references(:users, on_delete: :delete_all, type: :uuid)
            add :owner_user_id, references(:groups, on_delete: :delete_all, type: :uuid)

            timestamps()
        end

        # A video can't be both user owned and group owned, but it must be one
        create constraint("videos",
            :owner_must_be_singly_defined,
            check: "(owner_group_id IS NOT NULL AND owner_user_id IS NULL) OR (owner_user_id IS NOT NULL AND owner_group_id IS NULL)"
        )
    end
end