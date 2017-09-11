defmodule Backend.Redemption do
  use Ecto.Schema
  import Ecto.Changeset
  alias Backend.Redemption


  schema "redemptions" do
    field :metadata, :map
    field :timestamp, :naive_datetime
    field :user_id, :id
    field :deal_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Redemption{} = redemption, attrs) do
    redemption
    |> cast(attrs, [:timestamp, :metadata])
    |> validate_required([:timestamp, :metadata])
  end
end
