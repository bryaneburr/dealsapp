defmodule Backend.Deal do
  use Ecto.Schema
  import Ecto.Changeset
  alias Backend.Deal


  schema "deals" do
    field :created, :naive_datetime
    field :description, :string
    field :expires, :naive_datetime
    field :id, Ecto.UUID
    field :metadata, :map
    field :name, :string
    field :updated, :naive_datetime

    timestamps()
  end

  @doc false
  def changeset(%Deal{} = deal, attrs) do
    deal
    |> cast(attrs, [:id, :name, :description, :created, :updated, :expires, :metadata])
    |> validate_required([:id, :name, :description, :created, :updated, :expires, :metadata])
  end
end
