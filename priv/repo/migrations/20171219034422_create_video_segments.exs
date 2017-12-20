defmodule Api.Repo.Migrations.CreateVideoSegments do
  use Ecto.Migration

  def change do
    create table(:video_segments) do
      add :url, :string

      timestamps()
    end

  end
end
