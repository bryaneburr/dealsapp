defmodule Backend.Repo.Migrations.CreateDeals do
  use Ecto.Migration

  def change do
    create table(:deals) do
      add :id, :uuid
      add :name, :string
      add :description, :string
      add :created, :naive_datetime
      add :updated, :naive_datetime
      add :expires, :naive_datetime
      add :metadata, :map

      timestamps()
    end

  end
end
