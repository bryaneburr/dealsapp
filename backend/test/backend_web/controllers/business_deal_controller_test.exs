defmodule BackendWeb.BusinessDealControllerTest do
  use BackendWeb.ConnCase

  alias Backend.DealManagement

  @create_attrs %{metadata: %{}}
  @update_attrs %{metadata: %{}}
  @invalid_attrs %{metadata: nil}

  def fixture(:business_deal) do
    {:ok, business_deal} = DealManagement.create_business_deal(@create_attrs)
    business_deal
  end

  describe "index" do
    test "lists all business_deals", %{conn: conn} do
      conn = get conn, business_deal_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Business deals"
    end
  end

  describe "new business_deal" do
    test "renders form", %{conn: conn} do
      conn = get conn, business_deal_path(conn, :new)
      assert html_response(conn, 200) =~ "New Business deal"
    end
  end

  describe "create business_deal" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, business_deal_path(conn, :create), business_deal: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == business_deal_path(conn, :show, id)

      conn = get conn, business_deal_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Business deal"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, business_deal_path(conn, :create), business_deal: @invalid_attrs
      assert html_response(conn, 200) =~ "New Business deal"
    end
  end

  describe "edit business_deal" do
    setup [:create_business_deal]

    test "renders form for editing chosen business_deal", %{conn: conn, business_deal: business_deal} do
      conn = get conn, business_deal_path(conn, :edit, business_deal)
      assert html_response(conn, 200) =~ "Edit Business deal"
    end
  end

  describe "update business_deal" do
    setup [:create_business_deal]

    test "redirects when data is valid", %{conn: conn, business_deal: business_deal} do
      conn = put conn, business_deal_path(conn, :update, business_deal), business_deal: @update_attrs
      assert redirected_to(conn) == business_deal_path(conn, :show, business_deal)

      conn = get conn, business_deal_path(conn, :show, business_deal)
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, business_deal: business_deal} do
      conn = put conn, business_deal_path(conn, :update, business_deal), business_deal: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Business deal"
    end
  end

  describe "delete business_deal" do
    setup [:create_business_deal]

    test "deletes chosen business_deal", %{conn: conn, business_deal: business_deal} do
      conn = delete conn, business_deal_path(conn, :delete, business_deal)
      assert redirected_to(conn) == business_deal_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, business_deal_path(conn, :show, business_deal)
      end
    end
  end

  defp create_business_deal(_) do
    business_deal = fixture(:business_deal)
    {:ok, business_deal: business_deal}
  end
end
