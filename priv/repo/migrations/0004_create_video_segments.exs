defmodule Api.Repo.Migrations.CreateVideoSegments do
    use Ecto.Migration

    def change do
        ### Video Segments
        create table(:video_segments, primary_key: false) do
            add :id, :uuid, primary_key: true
            add :url, :string, null: false

            add :source_video_id, references(:source_videos, on_delete: :delete_all, type: :uuid)
            add :video_stream_id, references(:video_streams, on_delete: :delete_all, type: :uuid)

            timestamps()
        end

        # A video stream can't be both user owned and group owned, but it must be one
        create constraint("video_segments",
            :owner_must_be_singly_defined,
            check: "(source_video_id IS NOT NULL AND video_stream_id IS NULL) OR (video_stream_id IS NOT NULL AND source_video_id IS NULL)"
        )
    end
end