defmodule Api.Repo.Migrations.CreatePerformances do
  use Ecto.Migration

  def change do
    create table(:performances) do
      add :name, :string

      timestamps()
    end

  end
end
