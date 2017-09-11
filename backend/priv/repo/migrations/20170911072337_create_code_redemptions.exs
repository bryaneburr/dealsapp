defmodule Backend.Repo.Migrations.CreateCodeRedemptions do
  use Ecto.Migration

  def change do
    create table(:code_redemptions) do
      add :timestamp, :naive_datetime
      add :device_info, :string
      add :metadata, :map
      add :business_id, references(:businesses, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:code_redemptions, [:business_id])
    create index(:code_redemptions, [:user_id])
  end
end
