defmodule Backend.ActionManagementTest do
  use Backend.DataCase

  alias Backend.ActionManagement

  describe "actions" do
    alias Backend.ActionManagement.Action

    @valid_attrs %{action_type: "some action_type", metadata: %{}, timestamp: ~N[2010-04-17 14:00:00.000000]}
    @update_attrs %{action_type: "some updated action_type", metadata: %{}, timestamp: ~N[2011-05-18 15:01:01.000000]}
    @invalid_attrs %{action_type: nil, metadata: nil, timestamp: nil}

    def action_fixture(attrs \\ %{}) do
      {:ok, action} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ActionManagement.create_action()

      action
    end

    test "list_actions/0 returns all actions" do
      action = action_fixture()
      assert ActionManagement.list_actions() == [action]
    end

    test "get_action!/1 returns the action with given id" do
      action = action_fixture()
      assert ActionManagement.get_action!(action.id) == action
    end

    test "create_action/1 with valid data creates a action" do
      assert {:ok, %Action{} = action} = ActionManagement.create_action(@valid_attrs)
      assert action.action_type == "some action_type"
      assert action.metadata == %{}
      assert action.timestamp == ~N[2010-04-17 14:00:00.000000]
    end

    test "create_action/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ActionManagement.create_action(@invalid_attrs)
    end

    test "update_action/2 with valid data updates the action" do
      action = action_fixture()
      assert {:ok, action} = ActionManagement.update_action(action, @update_attrs)
      assert %Action{} = action
      assert action.action_type == "some updated action_type"
      assert action.metadata == %{}
      assert action.timestamp == ~N[2011-05-18 15:01:01.000000]
    end

    test "update_action/2 with invalid data returns error changeset" do
      action = action_fixture()
      assert {:error, %Ecto.Changeset{}} = ActionManagement.update_action(action, @invalid_attrs)
      assert action == ActionManagement.get_action!(action.id)
    end

    test "delete_action/1 deletes the action" do
      action = action_fixture()
      assert {:ok, %Action{}} = ActionManagement.delete_action(action)
      assert_raise Ecto.NoResultsError, fn -> ActionManagement.get_action!(action.id) end
    end

    test "change_action/1 returns a action changeset" do
      action = action_fixture()
      assert %Ecto.Changeset{} = ActionManagement.change_action(action)
    end
  end

  describe "deal_redemptions" do
    alias Backend.ActionManagement.DealRedemption

    @valid_attrs %{metadata: %{}, timestamp: ~N[2010-04-17 14:00:00.000000]}
    @update_attrs %{metadata: %{}, timestamp: ~N[2011-05-18 15:01:01.000000]}
    @invalid_attrs %{metadata: nil, timestamp: nil}

    def deal_redemption_fixture(attrs \\ %{}) do
      {:ok, deal_redemption} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ActionManagement.create_deal_redemption()

      deal_redemption
    end

    test "list_deal_redemptions/0 returns all deal_redemptions" do
      deal_redemption = deal_redemption_fixture()
      assert ActionManagement.list_deal_redemptions() == [deal_redemption]
    end

    test "get_deal_redemption!/1 returns the deal_redemption with given id" do
      deal_redemption = deal_redemption_fixture()
      assert ActionManagement.get_deal_redemption!(deal_redemption.id) == deal_redemption
    end

    test "create_deal_redemption/1 with valid data creates a deal_redemption" do
      assert {:ok, %DealRedemption{} = deal_redemption} = ActionManagement.create_deal_redemption(@valid_attrs)
      assert deal_redemption.metadata == %{}
      assert deal_redemption.timestamp == ~N[2010-04-17 14:00:00.000000]
    end

    test "create_deal_redemption/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ActionManagement.create_deal_redemption(@invalid_attrs)
    end

    test "update_deal_redemption/2 with valid data updates the deal_redemption" do
      deal_redemption = deal_redemption_fixture()
      assert {:ok, deal_redemption} = ActionManagement.update_deal_redemption(deal_redemption, @update_attrs)
      assert %DealRedemption{} = deal_redemption
      assert deal_redemption.metadata == %{}
      assert deal_redemption.timestamp == ~N[2011-05-18 15:01:01.000000]
    end

    test "update_deal_redemption/2 with invalid data returns error changeset" do
      deal_redemption = deal_redemption_fixture()
      assert {:error, %Ecto.Changeset{}} = ActionManagement.update_deal_redemption(deal_redemption, @invalid_attrs)
      assert deal_redemption == ActionManagement.get_deal_redemption!(deal_redemption.id)
    end

    test "delete_deal_redemption/1 deletes the deal_redemption" do
      deal_redemption = deal_redemption_fixture()
      assert {:ok, %DealRedemption{}} = ActionManagement.delete_deal_redemption(deal_redemption)
      assert_raise Ecto.NoResultsError, fn -> ActionManagement.get_deal_redemption!(deal_redemption.id) end
    end

    test "change_deal_redemption/1 returns a deal_redemption changeset" do
      deal_redemption = deal_redemption_fixture()
      assert %Ecto.Changeset{} = ActionManagement.change_deal_redemption(deal_redemption)
    end
  end

  describe "code_redemptions" do
    alias Backend.ActionManagement.CodeRedemption

    @valid_attrs %{device_info: "some device_info", metadata: %{}, timestamp: ~N[2010-04-17 14:00:00.000000]}
    @update_attrs %{device_info: "some updated device_info", metadata: %{}, timestamp: ~N[2011-05-18 15:01:01.000000]}
    @invalid_attrs %{device_info: nil, metadata: nil, timestamp: nil}

    def code_redemption_fixture(attrs \\ %{}) do
      {:ok, code_redemption} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ActionManagement.create_code_redemption()

      code_redemption
    end

    test "list_code_redemptions/0 returns all code_redemptions" do
      code_redemption = code_redemption_fixture()
      assert ActionManagement.list_code_redemptions() == [code_redemption]
    end

    test "get_code_redemption!/1 returns the code_redemption with given id" do
      code_redemption = code_redemption_fixture()
      assert ActionManagement.get_code_redemption!(code_redemption.id) == code_redemption
    end

    test "create_code_redemption/1 with valid data creates a code_redemption" do
      assert {:ok, %CodeRedemption{} = code_redemption} = ActionManagement.create_code_redemption(@valid_attrs)
      assert code_redemption.device_info == "some device_info"
      assert code_redemption.metadata == %{}
      assert code_redemption.timestamp == ~N[2010-04-17 14:00:00.000000]
    end

    test "create_code_redemption/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ActionManagement.create_code_redemption(@invalid_attrs)
    end

    test "update_code_redemption/2 with valid data updates the code_redemption" do
      code_redemption = code_redemption_fixture()
      assert {:ok, code_redemption} = ActionManagement.update_code_redemption(code_redemption, @update_attrs)
      assert %CodeRedemption{} = code_redemption
      assert code_redemption.device_info == "some updated device_info"
      assert code_redemption.metadata == %{}
      assert code_redemption.timestamp == ~N[2011-05-18 15:01:01.000000]
    end

    test "update_code_redemption/2 with invalid data returns error changeset" do
      code_redemption = code_redemption_fixture()
      assert {:error, %Ecto.Changeset{}} = ActionManagement.update_code_redemption(code_redemption, @invalid_attrs)
      assert code_redemption == ActionManagement.get_code_redemption!(code_redemption.id)
    end

    test "delete_code_redemption/1 deletes the code_redemption" do
      code_redemption = code_redemption_fixture()
      assert {:ok, %CodeRedemption{}} = ActionManagement.delete_code_redemption(code_redemption)
      assert_raise Ecto.NoResultsError, fn -> ActionManagement.get_code_redemption!(code_redemption.id) end
    end

    test "change_code_redemption/1 returns a code_redemption changeset" do
      code_redemption = code_redemption_fixture()
      assert %Ecto.Changeset{} = ActionManagement.change_code_redemption(code_redemption)
    end
  end
end
