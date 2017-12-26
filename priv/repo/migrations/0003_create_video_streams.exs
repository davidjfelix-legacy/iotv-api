defmodule Api.Repo.Migrations.CreateVideoStreams do
    use Ecto.Migration

    def change do
        ### Video Streams
        create table(:video_streams, primary_key: false) do
            add :id, :uuid, primary_key: true

            add :owner_user_id, references(:users, on_delete: :delete_all, type: :uuid)
            add :owner_group_id, references(:groups, on_delete: :delete_all, type: :uuid)

            timestamps()
        end

        # A video stream can't be both user owned and group owned, but it must be one
        create constraint("video_streams",
            :owner_must_be_singly_defined,
            check: "(owner_user_id IS NOT NULL AND owner_group_id IS NULL) OR (owner_group_id IS NOT NULL AND owner_user_id IS NULL)"
        )
    end
end