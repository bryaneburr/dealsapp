defmodule Backend.Repo.Migrations.CreateDealRedemptions do
  use Ecto.Migration

  def change do
    create table(:deal_redemptions) do
      add :timestamp, :naive_datetime
      add :metadata, :map
      add :user_id, references(:users, on_delete: :nothing)
      add :deal_id, references(:deals, on_delete: :nothing)

      timestamps()
    end

    create index(:deal_redemptions, [:user_id])
    create index(:deal_redemptions, [:deal_id])
  end
end
