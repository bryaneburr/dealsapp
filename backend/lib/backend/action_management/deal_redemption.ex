defmodule Backend.ActionManagement.DealRedemption do
  use Ecto.Schema
  import Ecto.Changeset
  alias Backend.ActionManagement.DealRedemption


  schema "deal_redemptions" do
    field :metadata, :map
    field :user_id, :id
    field :deal_id, :id

    timestamps()
  end

  @doc false
  def changeset(%DealRedemption{} = deal_redemption, attrs) do
    deal_redemption
    |> cast(attrs, [:metadata])
    |> validate_required([:metadata])
  end
end
