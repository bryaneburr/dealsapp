defmodule Backend.Repo.Migrations.CreateAdmins do
  use Ecto.Migration

  def change do
    create table(:admins) do
      add :id, :uuid
      add :email, :string
      add :phone, :string
      add :encrypted_password, :string
      add :name, :string
      add :metadata, :map

      timestamps()
    end

  end
end
