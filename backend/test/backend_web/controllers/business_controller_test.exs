defmodule BackendWeb.BusinessControllerTest do
  use BackendWeb.ConnCase

  alias Backend.BusinessManagement

  @create_attrs %{address: "some address", city: "some city", latitude: "some latitude", longitude: "some longitude", metadata: %{}, name: "some name", signup_code: "some signup_code", state: "some state", zipcode: "some zipcode"}
  @update_attrs %{address: "some updated address", city: "some updated city", latitude: "some updated latitude", longitude: "some updated longitude", metadata: %{}, name: "some updated name", signup_code: "some updated signup_code", state: "some updated state", zipcode: "some updated zipcode"}
  @invalid_attrs %{address: nil, city: nil, latitude: nil, longitude: nil, metadata: nil, name: nil, signup_code: nil, state: nil, zipcode: nil}

  def fixture(:business) do
    {:ok, business} = BusinessManagement.create_business(@create_attrs)
    business
  end

  describe "index" do
    test "lists all businesses", %{conn: conn} do
      conn = get conn, business_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Businesses"
    end
  end

  describe "new business" do
    test "renders form", %{conn: conn} do
      conn = get conn, business_path(conn, :new)
      assert html_response(conn, 200) =~ "New Business"
    end
  end

  describe "create business" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, business_path(conn, :create), business: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == business_path(conn, :show, id)

      conn = get conn, business_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Business"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, business_path(conn, :create), business: @invalid_attrs
      assert html_response(conn, 200) =~ "New Business"
    end
  end

  describe "edit business" do
    setup [:create_business]

    test "renders form for editing chosen business", %{conn: conn, business: business} do
      conn = get conn, business_path(conn, :edit, business)
      assert html_response(conn, 200) =~ "Edit Business"
    end
  end

  describe "update business" do
    setup [:create_business]

    test "redirects when data is valid", %{conn: conn, business: business} do
      conn = put conn, business_path(conn, :update, business), business: @update_attrs
      assert redirected_to(conn) == business_path(conn, :show, business)

      conn = get conn, business_path(conn, :show, business)
      assert html_response(conn, 200) =~ "some updated address"
    end

    test "renders errors when data is invalid", %{conn: conn, business: business} do
      conn = put conn, business_path(conn, :update, business), business: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Business"
    end
  end

  describe "delete business" do
    setup [:create_business]

    test "deletes chosen business", %{conn: conn, business: business} do
      conn = delete conn, business_path(conn, :delete, business)
      assert redirected_to(conn) == business_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, business_path(conn, :show, business)
      end
    end
  end

  defp create_business(_) do
    business = fixture(:business)
    {:ok, business: business}
  end
end
