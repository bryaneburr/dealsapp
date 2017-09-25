defmodule BackendWeb.DealRedemptionControllerTest do
  use BackendWeb.ConnCase

  alias Backend.ActionManagement

  @create_attrs %{metadata: %{}, timestamp: ~N[2010-04-17 14:00:00.000000]}
  @update_attrs %{metadata: %{}, timestamp: ~N[2011-05-18 15:01:01.000000]}
  @invalid_attrs %{metadata: nil, timestamp: nil}

  def fixture(:deal_redemption) do
    {:ok, deal_redemption} = ActionManagement.create_deal_redemption(@create_attrs)
    deal_redemption
  end

  describe "index" do
    test "lists all deal_redemptions", %{conn: conn} do
      conn = get conn, deal_redemption_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Deal redemptions"
    end
  end

  describe "new deal_redemption" do
    test "renders form", %{conn: conn} do
      conn = get conn, deal_redemption_path(conn, :new)
      assert html_response(conn, 200) =~ "New Deal redemption"
    end
  end

  describe "create deal_redemption" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, deal_redemption_path(conn, :create), deal_redemption: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == deal_redemption_path(conn, :show, id)

      conn = get conn, deal_redemption_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Deal redemption"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, deal_redemption_path(conn, :create), deal_redemption: @invalid_attrs
      assert html_response(conn, 200) =~ "New Deal redemption"
    end
  end

  describe "edit deal_redemption" do
    setup [:create_deal_redemption]

    test "renders form for editing chosen deal_redemption", %{conn: conn, deal_redemption: deal_redemption} do
      conn = get conn, deal_redemption_path(conn, :edit, deal_redemption)
      assert html_response(conn, 200) =~ "Edit Deal redemption"
    end
  end

  describe "update deal_redemption" do
    setup [:create_deal_redemption]

    test "redirects when data is valid", %{conn: conn, deal_redemption: deal_redemption} do
      conn = put conn, deal_redemption_path(conn, :update, deal_redemption), deal_redemption: @update_attrs
      assert redirected_to(conn) == deal_redemption_path(conn, :show, deal_redemption)

      conn = get conn, deal_redemption_path(conn, :show, deal_redemption)
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, deal_redemption: deal_redemption} do
      conn = put conn, deal_redemption_path(conn, :update, deal_redemption), deal_redemption: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Deal redemption"
    end
  end

  describe "delete deal_redemption" do
    setup [:create_deal_redemption]

    test "deletes chosen deal_redemption", %{conn: conn, deal_redemption: deal_redemption} do
      conn = delete conn, deal_redemption_path(conn, :delete, deal_redemption)
      assert redirected_to(conn) == deal_redemption_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, deal_redemption_path(conn, :show, deal_redemption)
      end
    end
  end

  defp create_deal_redemption(_) do
    deal_redemption = fixture(:deal_redemption)
    {:ok, deal_redemption: deal_redemption}
  end
end
