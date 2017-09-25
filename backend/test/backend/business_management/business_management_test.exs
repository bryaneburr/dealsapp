defmodule Backend.BusinessManagementTest do
  use Backend.DataCase

  alias Backend.BusinessManagement

  describe "businesses" do
    alias Backend.BusinessManagement.Business

    @valid_attrs %{address: "some address", city: "some city", latitude: "some latitude", longitude: "some longitude", metadata: %{}, name: "some name", signup_code: "some signup_code", state: "some state", zipcode: "some zipcode"}
    @update_attrs %{address: "some updated address", city: "some updated city", latitude: "some updated latitude", longitude: "some updated longitude", metadata: %{}, name: "some updated name", signup_code: "some updated signup_code", state: "some updated state", zipcode: "some updated zipcode"}
    @invalid_attrs %{address: nil, city: nil, latitude: nil, longitude: nil, metadata: nil, name: nil, signup_code: nil, state: nil, zipcode: nil}

    def business_fixture(attrs \\ %{}) do
      {:ok, business} =
        attrs
        |> Enum.into(@valid_attrs)
        |> BusinessManagement.create_business()

      business
    end

    test "list_businesses/0 returns all businesses" do
      business = business_fixture()
      assert BusinessManagement.list_businesses() == [business]
    end

    test "get_business!/1 returns the business with given id" do
      business = business_fixture()
      assert BusinessManagement.get_business!(business.id) == business
    end

    test "create_business/1 with valid data creates a business" do
      assert {:ok, %Business{} = business} = BusinessManagement.create_business(@valid_attrs)
      assert business.address == "some address"
      assert business.city == "some city"
      assert business.latitude == "some latitude"
      assert business.longitude == "some longitude"
      assert business.metadata == %{}
      assert business.name == "some name"
      assert business.signup_code == "some signup_code"
      assert business.state == "some state"
      assert business.zipcode == "some zipcode"
    end

    test "create_business/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = BusinessManagement.create_business(@invalid_attrs)
    end

    test "update_business/2 with valid data updates the business" do
      business = business_fixture()
      assert {:ok, business} = BusinessManagement.update_business(business, @update_attrs)
      assert %Business{} = business
      assert business.address == "some updated address"
      assert business.city == "some updated city"
      assert business.latitude == "some updated latitude"
      assert business.longitude == "some updated longitude"
      assert business.metadata == %{}
      assert business.name == "some updated name"
      assert business.signup_code == "some updated signup_code"
      assert business.state == "some updated state"
      assert business.zipcode == "some updated zipcode"
    end

    test "update_business/2 with invalid data returns error changeset" do
      business = business_fixture()
      assert {:error, %Ecto.Changeset{}} = BusinessManagement.update_business(business, @invalid_attrs)
      assert business == BusinessManagement.get_business!(business.id)
    end

    test "delete_business/1 deletes the business" do
      business = business_fixture()
      assert {:ok, %Business{}} = BusinessManagement.delete_business(business)
      assert_raise Ecto.NoResultsError, fn -> BusinessManagement.get_business!(business.id) end
    end

    test "change_business/1 returns a business changeset" do
      business = business_fixture()
      assert %Ecto.Changeset{} = BusinessManagement.change_business(business)
    end
  end
end
