defmodule Backend.BusinessManagement.Business do
  use Ecto.Schema
  import Ecto.Changeset
  alias Backend.BusinessManagement.Business


  schema "businesses" do
    field :address, :string
    field :city, :string
    field :latitude, :string
    field :longitude, :string
    field :metadata, :map
    field :name, :string
    field :signup_code, :string
    field :state, :string
    field :zipcode, :string

    timestamps()
  end

  @doc false
  def changeset(%Business{} = business, attrs) do
    business
    |> cast(attrs, [:name, :address, :state, :city, :zipcode, :latitude, :longitude, :signup_code, :metadata])
    |> validate_required([:name, :address, :state, :city, :zipcode, :latitude, :longitude, :signup_code, :metadata])
  end
end
