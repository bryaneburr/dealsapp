defmodule Backend.CodeRedemption do
  use Ecto.Schema
  import Ecto.Changeset
  alias Backend.CodeRedemption


  schema "code_redemptions" do
    field :device_info, :string
    field :metadata, :map
    field :business_id, :id
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(%CodeRedemption{} = code_redemption, attrs) do
    code_redemption
    |> cast(attrs, [:device_info, :metadata])
    |> validate_required([:device_info, :metadata])
  end
end
