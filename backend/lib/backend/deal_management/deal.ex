defmodule Backend.DealManagement.Deal do
  use Ecto.Schema
  import Ecto.Changeset
  alias Backend.DealManagement.Deal


  schema "deals" do
    field :created, :naive_datetime
    field :description, :string
    field :expires, :naive_datetime
    field :metadata, :map
    field :name, :string
    field :updated, :naive_datetime

    timestamps()
  end

  @doc false
  def changeset(%Deal{} = deal, attrs) do
    deal
    |> cast(attrs, [:name, :description, :created, :updated, :expires, :metadata])
    |> validate_required([:name, :description, :created, :updated, :expires, :metadata])
  end
end
