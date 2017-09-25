defmodule BackendWeb.DealControllerTest do
  use BackendWeb.ConnCase

  alias Backend.DealManagement

  @create_attrs %{created: ~N[2010-04-17 14:00:00.000000], description: "some description", expires: ~N[2010-04-17 14:00:00.000000], metadata: %{}, name: "some name", updated: ~N[2010-04-17 14:00:00.000000]}
  @update_attrs %{created: ~N[2011-05-18 15:01:01.000000], description: "some updated description", expires: ~N[2011-05-18 15:01:01.000000], metadata: %{}, name: "some updated name", updated: ~N[2011-05-18 15:01:01.000000]}
  @invalid_attrs %{created: nil, description: nil, expires: nil, metadata: nil, name: nil, updated: nil}

  def fixture(:deal) do
    {:ok, deal} = DealManagement.create_deal(@create_attrs)
    deal
  end

  describe "index" do
    test "lists all deals", %{conn: conn} do
      conn = get conn, deal_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Deals"
    end
  end

  describe "new deal" do
    test "renders form", %{conn: conn} do
      conn = get conn, deal_path(conn, :new)
      assert html_response(conn, 200) =~ "New Deal"
    end
  end

  describe "create deal" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, deal_path(conn, :create), deal: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == deal_path(conn, :show, id)

      conn = get conn, deal_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Deal"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, deal_path(conn, :create), deal: @invalid_attrs
      assert html_response(conn, 200) =~ "New Deal"
    end
  end

  describe "edit deal" do
    setup [:create_deal]

    test "renders form for editing chosen deal", %{conn: conn, deal: deal} do
      conn = get conn, deal_path(conn, :edit, deal)
      assert html_response(conn, 200) =~ "Edit Deal"
    end
  end

  describe "update deal" do
    setup [:create_deal]

    test "redirects when data is valid", %{conn: conn, deal: deal} do
      conn = put conn, deal_path(conn, :update, deal), deal: @update_attrs
      assert redirected_to(conn) == deal_path(conn, :show, deal)

      conn = get conn, deal_path(conn, :show, deal)
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, deal: deal} do
      conn = put conn, deal_path(conn, :update, deal), deal: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Deal"
    end
  end

  describe "delete deal" do
    setup [:create_deal]

    test "deletes chosen deal", %{conn: conn, deal: deal} do
      conn = delete conn, deal_path(conn, :delete, deal)
      assert redirected_to(conn) == deal_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, deal_path(conn, :show, deal)
      end
    end
  end

  defp create_deal(_) do
    deal = fixture(:deal)
    {:ok, deal: deal}
  end
end
