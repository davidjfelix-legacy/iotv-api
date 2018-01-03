defmodule Api.Repo.Migrations.CreateVideoSegmentPlaces do
    use Ecto.Migration

    def change do
        ### Video Segment Places
        create table(:video_segment_places, primary_key: false) do
            add :id, :uuid, primary_key: true
            add :playtime_in_video_ms, :integer, null: false
            add :segment_start_offset, :integer, null: false
            add :segment_end_offset, :integer, null: false

            add :video_segment_id, references(:video_segments, on_delete: :delete_all, type: :uuid), null: false
            add :video_id, references(:videos, on_delete: :delete_all, type: :uuid), null: false

            timestamps()
        end
    end
end
