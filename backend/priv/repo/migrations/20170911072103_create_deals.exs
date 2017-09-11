defmodule Backend.Repo.Migrations.CreateDeals do
  use Ecto.Migration

  def change do
    create table(:deals) do
      add :name, :string
      add :description, :string
      add :expires, :utc_datetime
      add :metadata, :map

      timestamps()
    end

  end
end
