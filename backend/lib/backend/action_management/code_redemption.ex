defmodule Backend.ActionManagement.CodeRedemption do
  use Ecto.Schema
  import Ecto.Changeset
  alias Backend.ActionManagement.CodeRedemption


  schema "code_redemptions" do
    field :device_info, :string
    field :metadata, :map
    field :timestamp, :naive_datetime
    field :business_id, :id
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(%CodeRedemption{} = code_redemption, attrs) do
    code_redemption
    |> cast(attrs, [:timestamp, :device_info, :metadata])
    |> validate_required([:timestamp, :device_info, :metadata])
  end
end
