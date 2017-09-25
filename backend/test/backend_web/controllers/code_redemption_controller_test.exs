defmodule BackendWeb.CodeRedemptionControllerTest do
  use BackendWeb.ConnCase

  alias Backend.ActionManagement

  @create_attrs %{device_info: "some device_info", metadata: %{}, timestamp: ~N[2010-04-17 14:00:00.000000]}
  @update_attrs %{device_info: "some updated device_info", metadata: %{}, timestamp: ~N[2011-05-18 15:01:01.000000]}
  @invalid_attrs %{device_info: nil, metadata: nil, timestamp: nil}

  def fixture(:code_redemption) do
    {:ok, code_redemption} = ActionManagement.create_code_redemption(@create_attrs)
    code_redemption
  end

  describe "index" do
    test "lists all code_redemptions", %{conn: conn} do
      conn = get conn, code_redemption_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Code redemptions"
    end
  end

  describe "new code_redemption" do
    test "renders form", %{conn: conn} do
      conn = get conn, code_redemption_path(conn, :new)
      assert html_response(conn, 200) =~ "New Code redemption"
    end
  end

  describe "create code_redemption" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, code_redemption_path(conn, :create), code_redemption: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == code_redemption_path(conn, :show, id)

      conn = get conn, code_redemption_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Code redemption"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, code_redemption_path(conn, :create), code_redemption: @invalid_attrs
      assert html_response(conn, 200) =~ "New Code redemption"
    end
  end

  describe "edit code_redemption" do
    setup [:create_code_redemption]

    test "renders form for editing chosen code_redemption", %{conn: conn, code_redemption: code_redemption} do
      conn = get conn, code_redemption_path(conn, :edit, code_redemption)
      assert html_response(conn, 200) =~ "Edit Code redemption"
    end
  end

  describe "update code_redemption" do
    setup [:create_code_redemption]

    test "redirects when data is valid", %{conn: conn, code_redemption: code_redemption} do
      conn = put conn, code_redemption_path(conn, :update, code_redemption), code_redemption: @update_attrs
      assert redirected_to(conn) == code_redemption_path(conn, :show, code_redemption)

      conn = get conn, code_redemption_path(conn, :show, code_redemption)
      assert html_response(conn, 200) =~ "some updated device_info"
    end

    test "renders errors when data is invalid", %{conn: conn, code_redemption: code_redemption} do
      conn = put conn, code_redemption_path(conn, :update, code_redemption), code_redemption: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Code redemption"
    end
  end

  describe "delete code_redemption" do
    setup [:create_code_redemption]

    test "deletes chosen code_redemption", %{conn: conn, code_redemption: code_redemption} do
      conn = delete conn, code_redemption_path(conn, :delete, code_redemption)
      assert redirected_to(conn) == code_redemption_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, code_redemption_path(conn, :show, code_redemption)
      end
    end
  end

  defp create_code_redemption(_) do
    code_redemption = fixture(:code_redemption)
    {:ok, code_redemption: code_redemption}
  end
end
