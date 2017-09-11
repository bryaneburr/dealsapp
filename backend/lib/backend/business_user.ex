defmodule Backend.BusinessUser do
  use Ecto.Schema
  import Ecto.Changeset
  alias Backend.BusinessUser


  schema "business_users" do
    field :is_owner, :boolean, default: false
    field :metadata, :map
    field :user_id, :id
    field :business_id, :id

    timestamps()
  end

  @doc false
  def changeset(%BusinessUser{} = business_user, attrs) do
    business_user
    |> cast(attrs, [:is_owner, :metadata])
    |> validate_required([:is_owner, :metadata])
  end
end
