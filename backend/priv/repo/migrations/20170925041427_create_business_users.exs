defmodule Backend.Repo.Migrations.CreateBusinessUsers do
  use Ecto.Migration

  def change do
    create table(:business_users) do
      add :is_owner, :boolean, default: false, null: false
      add :metadata, :map
      add :user_id, references(:users, on_delete: :nothing)
      add :business_id, references(:businesses, on_delete: :nothing)

      timestamps()
    end

    create index(:business_users, [:user_id])
    create index(:business_users, [:business_id])
  end
end
