defmodule BackendWeb.BusinessDealController do
  use BackendWeb, :controller

  alias Backend.DealManagement
  alias Backend.DealManagement.BusinessDeal

  def index(conn, _params) do
    business_deals = DealManagement.list_business_deals()
    render(conn, "index.html", business_deals: business_deals)
  end

  def new(conn, _params) do
    changeset = DealManagement.change_business_deal(%BusinessDeal{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"business_deal" => business_deal_params}) do
    case DealManagement.create_business_deal(business_deal_params) do
      {:ok, business_deal} ->
        conn
        |> put_flash(:info, "Business deal created successfully.")
        |> redirect(to: business_deal_path(conn, :show, business_deal))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    business_deal = DealManagement.get_business_deal!(id)
    render(conn, "show.html", business_deal: business_deal)
  end

  def edit(conn, %{"id" => id}) do
    business_deal = DealManagement.get_business_deal!(id)
    changeset = DealManagement.change_business_deal(business_deal)
    render(conn, "edit.html", business_deal: business_deal, changeset: changeset)
  end

  def update(conn, %{"id" => id, "business_deal" => business_deal_params}) do
    business_deal = DealManagement.get_business_deal!(id)

    case DealManagement.update_business_deal(business_deal, business_deal_params) do
      {:ok, business_deal} ->
        conn
        |> put_flash(:info, "Business deal updated successfully.")
        |> redirect(to: business_deal_path(conn, :show, business_deal))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", business_deal: business_deal, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    business_deal = DealManagement.get_business_deal!(id)
    {:ok, _business_deal} = DealManagement.delete_business_deal(business_deal)

    conn
    |> put_flash(:info, "Business deal deleted successfully.")
    |> redirect(to: business_deal_path(conn, :index))
  end
end
