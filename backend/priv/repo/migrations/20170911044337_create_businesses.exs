defmodule Backend.Repo.Migrations.CreateBusinesses do
  use Ecto.Migration

  def change do
    create table(:businesses) do
      add :id, :uuid
      add :name, :string
      add :address, :string
      add :state, :string
      add :city, :string
      add :zipcode, :string
      add :latitude, :string
      add :longitude, :string
      add :signup_code, :string
      add :metadata, :map

      timestamps()
    end

  end
end
