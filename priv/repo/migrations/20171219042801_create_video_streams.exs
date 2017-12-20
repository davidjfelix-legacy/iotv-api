defmodule Api.Repo.Migrations.CreateVideoStreams do
  use Ecto.Migration

  def change do
    create table(:video_streams) do
      add :url, :string

      timestamps()
    end

  end
end
