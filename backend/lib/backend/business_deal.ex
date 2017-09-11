defmodule Backend.BusinessDeal do
  use Ecto.Schema
  import Ecto.Changeset
  alias Backend.BusinessDeal


  schema "business_deals" do
    field :metadata, :map
    field :deal_id, :id
    field :business_id, :id

    timestamps()
  end

  @doc false
  def changeset(%BusinessDeal{} = business_deal, attrs) do
    business_deal
    |> cast(attrs, [:metadata])
    |> validate_required([:metadata])
  end
end
