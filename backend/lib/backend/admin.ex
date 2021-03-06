defmodule Backend.Admin do
  use Ecto.Schema
  import Ecto.Changeset
  alias Backend.Admin


  schema "admins" do
    field :email, :string
    field :encrypted_password, :string
    field :id, Ecto.UUID
    field :metadata, :map
    field :name, :string
    field :phone, :string

    timestamps()
  end

  @doc false
  def changeset(%Admin{} = admin, attrs) do
    admin
    |> cast(attrs, [:id, :email, :phone, :encrypted_password, :name, :metadata])
    |> validate_required([:id, :email, :phone, :encrypted_password, :name, :metadata])
  end
end
