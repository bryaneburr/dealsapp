defmodule Backend.AccountsTest do
  use Backend.DataCase

  alias Backend.Accounts

  describe "users" do
    alias Backend.Accounts.User

    @valid_attrs %{email: "some email", encrypted_password: "some encrypted_password", id: "7488a646-e31f-11e4-aace-600308960662", metadata: %{}, name: "some name", phone: "some phone"}
    @update_attrs %{email: "some updated email", encrypted_password: "some updated encrypted_password", id: "7488a646-e31f-11e4-aace-600308960668", metadata: %{}, name: "some updated name", phone: "some updated phone"}
    @invalid_attrs %{email: nil, encrypted_password: nil, id: nil, metadata: nil, name: nil, phone: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.encrypted_password == "some encrypted_password"
      assert user.id == "7488a646-e31f-11e4-aace-600308960662"
      assert user.metadata == %{}
      assert user.name == "some name"
      assert user.phone == "some phone"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Accounts.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.email == "some updated email"
      assert user.encrypted_password == "some updated encrypted_password"
      assert user.id == "7488a646-e31f-11e4-aace-600308960668"
      assert user.metadata == %{}
      assert user.name == "some updated name"
      assert user.phone == "some updated phone"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "users" do
    alias Backend.Accounts.User

    @valid_attrs %{email: "some email", encrypted_password: "some encrypted_password", metadata: %{}, name: "some name", phone: "some phone"}
    @update_attrs %{email: "some updated email", encrypted_password: "some updated encrypted_password", metadata: %{}, name: "some updated name", phone: "some updated phone"}
    @invalid_attrs %{email: nil, encrypted_password: nil, metadata: nil, name: nil, phone: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.encrypted_password == "some encrypted_password"
      assert user.metadata == %{}
      assert user.name == "some name"
      assert user.phone == "some phone"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Accounts.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.email == "some updated email"
      assert user.encrypted_password == "some updated encrypted_password"
      assert user.metadata == %{}
      assert user.name == "some updated name"
      assert user.phone == "some updated phone"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "business_users" do
    alias Backend.Accounts.BusinessUser

    @valid_attrs %{is_owner: true, metadata: %{}}
    @update_attrs %{is_owner: false, metadata: %{}}
    @invalid_attrs %{is_owner: nil, metadata: nil}

    def business_user_fixture(attrs \\ %{}) do
      {:ok, business_user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_business_user()

      business_user
    end

    test "list_business_users/0 returns all business_users" do
      business_user = business_user_fixture()
      assert Accounts.list_business_users() == [business_user]
    end

    test "get_business_user!/1 returns the business_user with given id" do
      business_user = business_user_fixture()
      assert Accounts.get_business_user!(business_user.id) == business_user
    end

    test "create_business_user/1 with valid data creates a business_user" do
      assert {:ok, %BusinessUser{} = business_user} = Accounts.create_business_user(@valid_attrs)
      assert business_user.is_owner == true
      assert business_user.metadata == %{}
    end

    test "create_business_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_business_user(@invalid_attrs)
    end

    test "update_business_user/2 with valid data updates the business_user" do
      business_user = business_user_fixture()
      assert {:ok, business_user} = Accounts.update_business_user(business_user, @update_attrs)
      assert %BusinessUser{} = business_user
      assert business_user.is_owner == false
      assert business_user.metadata == %{}
    end

    test "update_business_user/2 with invalid data returns error changeset" do
      business_user = business_user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_business_user(business_user, @invalid_attrs)
      assert business_user == Accounts.get_business_user!(business_user.id)
    end

    test "delete_business_user/1 deletes the business_user" do
      business_user = business_user_fixture()
      assert {:ok, %BusinessUser{}} = Accounts.delete_business_user(business_user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_business_user!(business_user.id) end
    end

    test "change_business_user/1 returns a business_user changeset" do
      business_user = business_user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_business_user(business_user)
    end
  end
end
