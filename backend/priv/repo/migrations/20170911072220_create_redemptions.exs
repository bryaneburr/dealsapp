defmodule Backend.Repo.Migrations.CreateRedemptions do
  use Ecto.Migration

  def change do
    create table(:redemptions) do
      add :timestamp, :naive_datetime
      add :metadata, :map
      add :user_id, references(:users, on_delete: :nothing)
      add :deal_id, references(:deals, on_delete: :nothing)

      timestamps()
    end

    create index(:redemptions, [:user_id])
    create index(:redemptions, [:deal_id])
  end
end
