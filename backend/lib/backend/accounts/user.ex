defmodule Backend.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Backend.Accounts.User


  schema "users" do
    field :email, :string
    field :encrypted_password, :string
    field :metadata, :map
    field :name, :string
    field :phone, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:phone, :email, :name, :encrypted_password, :metadata])
    |> validate_required([:phone, :email, :name, :encrypted_password, :metadata])
  end
end
