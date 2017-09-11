defmodule Backend.Repo.Migrations.CreateActions do
  use Ecto.Migration

  def change do
    create table(:actions) do
      add :action_type, :string
      add :timestamp, :naive_datetime
      add :metadata, :map
      add :user_id, references(:users, on_delete: :nothing)
      add :deal_id, references(:deals, on_delete: :nothing)

      timestamps()
    end

    create index(:actions, [:user_id])
    create index(:actions, [:deal_id])
  end
end
