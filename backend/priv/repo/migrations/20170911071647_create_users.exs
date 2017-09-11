defmodule Backend.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :phone, :string
      add :email, :string
      add :name, :string
      add :encrypted_password, :string
      add :metadata, :map

      timestamps()
    end

  end
end
