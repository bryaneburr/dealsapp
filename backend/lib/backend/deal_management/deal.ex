defmodule Backend.DealManagement.Deal do
  use Ecto.Schema
  import Ecto.Changeset
  alias Backend.DealManagement.Deal


  schema "deals" do
    field :description, :string
    field :expires, :naive_datetime
    field :metadata, :map
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Deal{} = deal, attrs) do
    deal
    |> cast(attrs, [:name, :description, :expires, :metadata])
    |> validate_required([:name, :description, :expires, :metadata])
  end
end
