defmodule Backend.Administration.Admin do
  use Ecto.Schema
  import Ecto.Changeset
  alias Backend.Administration.Admin


  schema "admins" do
    field :email, :string
    field :encrypted_password, :string
    field :metadata, :map
    field :name, :string
    field :phone, :string

    timestamps()
  end

  @doc false
  def changeset(%Admin{} = admin, attrs) do
    admin
    |> cast(attrs, [:email, :phone, :encrypted_password, :name, :metadata])
    |> validate_required([:email, :phone, :encrypted_password, :name, :metadata])
  end
end
