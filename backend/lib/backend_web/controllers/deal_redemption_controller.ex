defmodule BackendWeb.DealRedemptionController do
  use BackendWeb, :controller

  alias Backend.ActionManagement
  alias Backend.ActionManagement.DealRedemption

  def index(conn, _params) do
    deal_redemptions = ActionManagement.list_deal_redemptions()
    render(conn, "index.html", deal_redemptions: deal_redemptions)
  end

  def new(conn, _params) do
    changeset = ActionManagement.change_deal_redemption(%DealRedemption{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"deal_redemption" => deal_redemption_params}) do
    case ActionManagement.create_deal_redemption(deal_redemption_params) do
      {:ok, deal_redemption} ->
        conn
        |> put_flash(:info, "Deal redemption created successfully.")
        |> redirect(to: deal_redemption_path(conn, :show, deal_redemption))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    deal_redemption = ActionManagement.get_deal_redemption!(id)
    render(conn, "show.html", deal_redemption: deal_redemption)
  end

  def edit(conn, %{"id" => id}) do
    deal_redemption = ActionManagement.get_deal_redemption!(id)
    changeset = ActionManagement.change_deal_redemption(deal_redemption)
    render(conn, "edit.html", deal_redemption: deal_redemption, changeset: changeset)
  end

  def update(conn, %{"id" => id, "deal_redemption" => deal_redemption_params}) do
    deal_redemption = ActionManagement.get_deal_redemption!(id)

    case ActionManagement.update_deal_redemption(deal_redemption, deal_redemption_params) do
      {:ok, deal_redemption} ->
        conn
        |> put_flash(:info, "Deal redemption updated successfully.")
        |> redirect(to: deal_redemption_path(conn, :show, deal_redemption))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", deal_redemption: deal_redemption, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    deal_redemption = ActionManagement.get_deal_redemption!(id)
    {:ok, _deal_redemption} = ActionManagement.delete_deal_redemption(deal_redemption)

    conn
    |> put_flash(:info, "Deal redemption deleted successfully.")
    |> redirect(to: deal_redemption_path(conn, :index))
  end
end
