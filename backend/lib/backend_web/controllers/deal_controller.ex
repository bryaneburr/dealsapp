defmodule BackendWeb.DealController do
  use BackendWeb, :controller

  alias Backend.DealManagement
  alias Backend.DealManagement.Deal

  def index(conn, _params) do
    deals = DealManagement.list_deals()
    render(conn, "index.html", deals: deals)
  end

  def new(conn, _params) do
    changeset = DealManagement.change_deal(%Deal{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"deal" => deal_params}) do
    case DealManagement.create_deal(deal_params) do
      {:ok, deal} ->
        conn
        |> put_flash(:info, "Deal created successfully.")
        |> redirect(to: deal_path(conn, :show, deal))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    deal = DealManagement.get_deal!(id)
    render(conn, "show.html", deal: deal)
  end

  def edit(conn, %{"id" => id}) do
    deal = DealManagement.get_deal!(id)
    changeset = DealManagement.change_deal(deal)
    render(conn, "edit.html", deal: deal, changeset: changeset)
  end

  def update(conn, %{"id" => id, "deal" => deal_params}) do
    deal = DealManagement.get_deal!(id)

    case DealManagement.update_deal(deal, deal_params) do
      {:ok, deal} ->
        conn
        |> put_flash(:info, "Deal updated successfully.")
        |> redirect(to: deal_path(conn, :show, deal))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", deal: deal, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    deal = DealManagement.get_deal!(id)
    {:ok, _deal} = DealManagement.delete_deal(deal)

    conn
    |> put_flash(:info, "Deal deleted successfully.")
    |> redirect(to: deal_path(conn, :index))
  end
end
