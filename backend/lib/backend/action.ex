defmodule Backend.Action do
  use Ecto.Schema
  import Ecto.Changeset
  alias Backend.Action


  schema "actions" do
    field :action_type, :string
    field :metadata, :map
    field :user_id, :id
    field :deal_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Action{} = action, attrs) do
    action
    |> cast(attrs, [:action_type, :metadata])
    |> validate_required([:action_type, :metadata])
  end
end
