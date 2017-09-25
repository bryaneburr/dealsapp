defmodule BackendWeb.ActionControllerTest do
  use BackendWeb.ConnCase

  alias Backend.ActionManagement

  @create_attrs %{action_type: "some action_type", metadata: %{}, timestamp: ~N[2010-04-17 14:00:00.000000]}
  @update_attrs %{action_type: "some updated action_type", metadata: %{}, timestamp: ~N[2011-05-18 15:01:01.000000]}
  @invalid_attrs %{action_type: nil, metadata: nil, timestamp: nil}

  def fixture(:action) do
    {:ok, action} = ActionManagement.create_action(@create_attrs)
    action
  end

  describe "index" do
    test "lists all actions", %{conn: conn} do
      conn = get conn, action_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Actions"
    end
  end

  describe "new action" do
    test "renders form", %{conn: conn} do
      conn = get conn, action_path(conn, :new)
      assert html_response(conn, 200) =~ "New Action"
    end
  end

  describe "create action" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, action_path(conn, :create), action: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == action_path(conn, :show, id)

      conn = get conn, action_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Action"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, action_path(conn, :create), action: @invalid_attrs
      assert html_response(conn, 200) =~ "New Action"
    end
  end

  describe "edit action" do
    setup [:create_action]

    test "renders form for editing chosen action", %{conn: conn, action: action} do
      conn = get conn, action_path(conn, :edit, action)
      assert html_response(conn, 200) =~ "Edit Action"
    end
  end

  describe "update action" do
    setup [:create_action]

    test "redirects when data is valid", %{conn: conn, action: action} do
      conn = put conn, action_path(conn, :update, action), action: @update_attrs
      assert redirected_to(conn) == action_path(conn, :show, action)

      conn = get conn, action_path(conn, :show, action)
      assert html_response(conn, 200) =~ "some updated action_type"
    end

    test "renders errors when data is invalid", %{conn: conn, action: action} do
      conn = put conn, action_path(conn, :update, action), action: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Action"
    end
  end

  describe "delete action" do
    setup [:create_action]

    test "deletes chosen action", %{conn: conn, action: action} do
      conn = delete conn, action_path(conn, :delete, action)
      assert redirected_to(conn) == action_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, action_path(conn, :show, action)
      end
    end
  end

  defp create_action(_) do
    action = fixture(:action)
    {:ok, action: action}
  end
end
