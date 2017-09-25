defmodule Backend.DealManagementTest do
  use Backend.DataCase

  alias Backend.DealManagement

  describe "deals" do
    alias Backend.DealManagement.Deal

    @valid_attrs %{created: ~N[2010-04-17 14:00:00.000000], description: "some description", expires: ~N[2010-04-17 14:00:00.000000], metadata: %{}, name: "some name", updated: ~N[2010-04-17 14:00:00.000000]}
    @update_attrs %{created: ~N[2011-05-18 15:01:01.000000], description: "some updated description", expires: ~N[2011-05-18 15:01:01.000000], metadata: %{}, name: "some updated name", updated: ~N[2011-05-18 15:01:01.000000]}
    @invalid_attrs %{created: nil, description: nil, expires: nil, metadata: nil, name: nil, updated: nil}

    def deal_fixture(attrs \\ %{}) do
      {:ok, deal} =
        attrs
        |> Enum.into(@valid_attrs)
        |> DealManagement.create_deal()

      deal
    end

    test "list_deals/0 returns all deals" do
      deal = deal_fixture()
      assert DealManagement.list_deals() == [deal]
    end

    test "get_deal!/1 returns the deal with given id" do
      deal = deal_fixture()
      assert DealManagement.get_deal!(deal.id) == deal
    end

    test "create_deal/1 with valid data creates a deal" do
      assert {:ok, %Deal{} = deal} = DealManagement.create_deal(@valid_attrs)
      assert deal.created == ~N[2010-04-17 14:00:00.000000]
      assert deal.description == "some description"
      assert deal.expires == ~N[2010-04-17 14:00:00.000000]
      assert deal.metadata == %{}
      assert deal.name == "some name"
      assert deal.updated == ~N[2010-04-17 14:00:00.000000]
    end

    test "create_deal/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = DealManagement.create_deal(@invalid_attrs)
    end

    test "update_deal/2 with valid data updates the deal" do
      deal = deal_fixture()
      assert {:ok, deal} = DealManagement.update_deal(deal, @update_attrs)
      assert %Deal{} = deal
      assert deal.created == ~N[2011-05-18 15:01:01.000000]
      assert deal.description == "some updated description"
      assert deal.expires == ~N[2011-05-18 15:01:01.000000]
      assert deal.metadata == %{}
      assert deal.name == "some updated name"
      assert deal.updated == ~N[2011-05-18 15:01:01.000000]
    end

    test "update_deal/2 with invalid data returns error changeset" do
      deal = deal_fixture()
      assert {:error, %Ecto.Changeset{}} = DealManagement.update_deal(deal, @invalid_attrs)
      assert deal == DealManagement.get_deal!(deal.id)
    end

    test "delete_deal/1 deletes the deal" do
      deal = deal_fixture()
      assert {:ok, %Deal{}} = DealManagement.delete_deal(deal)
      assert_raise Ecto.NoResultsError, fn -> DealManagement.get_deal!(deal.id) end
    end

    test "change_deal/1 returns a deal changeset" do
      deal = deal_fixture()
      assert %Ecto.Changeset{} = DealManagement.change_deal(deal)
    end
  end

  describe "business_deals" do
    alias Backend.DealManagement.BusinessDeal

    @valid_attrs %{metadata: %{}}
    @update_attrs %{metadata: %{}}
    @invalid_attrs %{metadata: nil}

    def business_deal_fixture(attrs \\ %{}) do
      {:ok, business_deal} =
        attrs
        |> Enum.into(@valid_attrs)
        |> DealManagement.create_business_deal()

      business_deal
    end

    test "list_business_deals/0 returns all business_deals" do
      business_deal = business_deal_fixture()
      assert DealManagement.list_business_deals() == [business_deal]
    end

    test "get_business_deal!/1 returns the business_deal with given id" do
      business_deal = business_deal_fixture()
      assert DealManagement.get_business_deal!(business_deal.id) == business_deal
    end

    test "create_business_deal/1 with valid data creates a business_deal" do
      assert {:ok, %BusinessDeal{} = business_deal} = DealManagement.create_business_deal(@valid_attrs)
      assert business_deal.metadata == %{}
    end

    test "create_business_deal/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = DealManagement.create_business_deal(@invalid_attrs)
    end

    test "update_business_deal/2 with valid data updates the business_deal" do
      business_deal = business_deal_fixture()
      assert {:ok, business_deal} = DealManagement.update_business_deal(business_deal, @update_attrs)
      assert %BusinessDeal{} = business_deal
      assert business_deal.metadata == %{}
    end

    test "update_business_deal/2 with invalid data returns error changeset" do
      business_deal = business_deal_fixture()
      assert {:error, %Ecto.Changeset{}} = DealManagement.update_business_deal(business_deal, @invalid_attrs)
      assert business_deal == DealManagement.get_business_deal!(business_deal.id)
    end

    test "delete_business_deal/1 deletes the business_deal" do
      business_deal = business_deal_fixture()
      assert {:ok, %BusinessDeal{}} = DealManagement.delete_business_deal(business_deal)
      assert_raise Ecto.NoResultsError, fn -> DealManagement.get_business_deal!(business_deal.id) end
    end

    test "change_business_deal/1 returns a business_deal changeset" do
      business_deal = business_deal_fixture()
      assert %Ecto.Changeset{} = DealManagement.change_business_deal(business_deal)
    end
  end
end
