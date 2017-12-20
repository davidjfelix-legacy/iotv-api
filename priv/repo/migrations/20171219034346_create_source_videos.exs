defmodule Api.Repo.Migrations.CreateSourceVideos do
  use Ecto.Migration

  def change do
    create table(:source_videos) do
      add :url, :string

      timestamps()
    end

  end
end
