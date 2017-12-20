defmodule Api.Repo.Migrations.CreateSeries do
  use Ecto.Migration

  def change do
    create table(:series) do
      add :name, :string

      timestamps()
    end

  end
end
