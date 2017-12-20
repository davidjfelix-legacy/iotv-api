defmodule Api.Repo.Migrations.CreateVideos do
  use Ecto.Migration

  def change do
    create table(:videos) do
      add :title, :string

      timestamps()
    end

  end
end
