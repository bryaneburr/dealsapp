defmodule Backend.Redemption do
  use Ecto.Schema
  import Ecto.Changeset
  alias Backend.Redemption


  schema "redemptions" do
    field :metadata, :map
    field :user_id, :id
    field :deal_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Redemption{} = redemption, attrs) do
    redemption
    |> cast(attrs, [:metadata])
    |> validate_required([:metadata])
  end
end
