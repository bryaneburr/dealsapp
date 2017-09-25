defmodule Backend.ActionManagement.Action do
  use Ecto.Schema
  import Ecto.Changeset
  alias Backend.ActionManagement.Action


  schema "actions" do
    field :action_type, :string
    field :metadata, :map
    field :timestamp, :naive_datetime
    field :user_id, :id
    field :deal_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Action{} = action, attrs) do
    action
    |> cast(attrs, [:action_type, :timestamp, :metadata])
    |> validate_required([:action_type, :timestamp, :metadata])
  end
end
