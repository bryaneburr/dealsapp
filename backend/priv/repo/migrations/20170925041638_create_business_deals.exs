defmodule Backend.Repo.Migrations.CreateBusinessDeals do
  use Ecto.Migration

  def change do
    create table(:business_deals) do
      add :metadata, :map
      add :deal_id, references(:deals, on_delete: :nothing)
      add :business_id, references(:businesses, on_delete: :nothing)

      timestamps()
    end

    create index(:business_deals, [:deal_id])
    create index(:business_deals, [:business_id])
  end
end
