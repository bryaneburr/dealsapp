defmodule Backend.AdministrationTest do
  use Backend.DataCase

  alias Backend.Administration

  describe "admins" do
    alias Backend.Administration.Admin

    @valid_attrs %{email: "some email", encrypted_password: "some encrypted_password", metadata: %{}, name: "some name", phone: "some phone"}
    @update_attrs %{email: "some updated email", encrypted_password: "some updated encrypted_password", metadata: %{}, name: "some updated name", phone: "some updated phone"}
    @invalid_attrs %{email: nil, encrypted_password: nil, metadata: nil, name: nil, phone: nil}

    def admin_fixture(attrs \\ %{}) do
      {:ok, admin} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Administration.create_admin()

      admin
    end

    test "list_admins/0 returns all admins" do
      admin = admin_fixture()
      assert Administration.list_admins() == [admin]
    end

    test "get_admin!/1 returns the admin with given id" do
      admin = admin_fixture()
      assert Administration.get_admin!(admin.id) == admin
    end

    test "create_admin/1 with valid data creates a admin" do
      assert {:ok, %Admin{} = admin} = Administration.create_admin(@valid_attrs)
      assert admin.email == "some email"
      assert admin.encrypted_password == "some encrypted_password"
      assert admin.metadata == %{}
      assert admin.name == "some name"
      assert admin.phone == "some phone"
    end

    test "create_admin/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Administration.create_admin(@invalid_attrs)
    end

    test "update_admin/2 with valid data updates the admin" do
      admin = admin_fixture()
      assert {:ok, admin} = Administration.update_admin(admin, @update_attrs)
      assert %Admin{} = admin
      assert admin.email == "some updated email"
      assert admin.encrypted_password == "some updated encrypted_password"
      assert admin.metadata == %{}
      assert admin.name == "some updated name"
      assert admin.phone == "some updated phone"
    end

    test "update_admin/2 with invalid data returns error changeset" do
      admin = admin_fixture()
      assert {:error, %Ecto.Changeset{}} = Administration.update_admin(admin, @invalid_attrs)
      assert admin == Administration.get_admin!(admin.id)
    end

    test "delete_admin/1 deletes the admin" do
      admin = admin_fixture()
      assert {:ok, %Admin{}} = Administration.delete_admin(admin)
      assert_raise Ecto.NoResultsError, fn -> Administration.get_admin!(admin.id) end
    end

    test "change_admin/1 returns a admin changeset" do
      admin = admin_fixture()
      assert %Ecto.Changeset{} = Administration.change_admin(admin)
    end
  end
end
