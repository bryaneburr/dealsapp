defmodule BackendWeb.BusinessUserControllerTest do
  use BackendWeb.ConnCase

  alias Backend.Accounts

  @create_attrs %{is_owner: true, metadata: %{}}
  @update_attrs %{is_owner: false, metadata: %{}}
  @invalid_attrs %{is_owner: nil, metadata: nil}

  def fixture(:business_user) do
    {:ok, business_user} = Accounts.create_business_user(@create_attrs)
    business_user
  end

  describe "index" do
    test "lists all business_users", %{conn: conn} do
      conn = get conn, business_user_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Business users"
    end
  end

  describe "new business_user" do
    test "renders form", %{conn: conn} do
      conn = get conn, business_user_path(conn, :new)
      assert html_response(conn, 200) =~ "New Business user"
    end
  end

  describe "create business_user" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, business_user_path(conn, :create), business_user: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == business_user_path(conn, :show, id)

      conn = get conn, business_user_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Business user"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, business_user_path(conn, :create), business_user: @invalid_attrs
      assert html_response(conn, 200) =~ "New Business user"
    end
  end

  describe "edit business_user" do
    setup [:create_business_user]

    test "renders form for editing chosen business_user", %{conn: conn, business_user: business_user} do
      conn = get conn, business_user_path(conn, :edit, business_user)
      assert html_response(conn, 200) =~ "Edit Business user"
    end
  end

  describe "update business_user" do
    setup [:create_business_user]

    test "redirects when data is valid", %{conn: conn, business_user: business_user} do
      conn = put conn, business_user_path(conn, :update, business_user), business_user: @update_attrs
      assert redirected_to(conn) == business_user_path(conn, :show, business_user)

      conn = get conn, business_user_path(conn, :show, business_user)
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, business_user: business_user} do
      conn = put conn, business_user_path(conn, :update, business_user), business_user: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Business user"
    end
  end

  describe "delete business_user" do
    setup [:create_business_user]

    test "deletes chosen business_user", %{conn: conn, business_user: business_user} do
      conn = delete conn, business_user_path(conn, :delete, business_user)
      assert redirected_to(conn) == business_user_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, business_user_path(conn, :show, business_user)
      end
    end
  end

  defp create_business_user(_) do
    business_user = fixture(:business_user)
    {:ok, business_user: business_user}
  end
end
