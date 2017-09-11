defmodule Backend.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Backend.User


  schema "users" do
    field :email, :string
    field :encrypted_password, :string
    field :id, Ecto.UUID
    field :metadata, :map
    field :name, :string
    field :phone, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:id, :phone, :email, :name, :encrypted_password, :metadata])
    |> validate_required([:id, :phone, :email, :name, :encrypted_password, :metadata])
  end
end
