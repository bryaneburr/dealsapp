defmodule BackendWeb.CodeRedemptionController do
  use BackendWeb, :controller

  alias Backend.ActionManagement
  alias Backend.ActionManagement.CodeRedemption

  def index(conn, _params) do
    code_redemptions = ActionManagement.list_code_redemptions()
    render(conn, "index.html", code_redemptions: code_redemptions)
  end

  def new(conn, _params) do
    changeset = ActionManagement.change_code_redemption(%CodeRedemption{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"code_redemption" => code_redemption_params}) do
    case ActionManagement.create_code_redemption(code_redemption_params) do
      {:ok, code_redemption} ->
        conn
        |> put_flash(:info, "Code redemption created successfully.")
        |> redirect(to: code_redemption_path(conn, :show, code_redemption))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    code_redemption = ActionManagement.get_code_redemption!(id)
    render(conn, "show.html", code_redemption: code_redemption)
  end

  def edit(conn, %{"id" => id}) do
    code_redemption = ActionManagement.get_code_redemption!(id)
    changeset = ActionManagement.change_code_redemption(code_redemption)
    render(conn, "edit.html", code_redemption: code_redemption, changeset: changeset)
  end

  def update(conn, %{"id" => id, "code_redemption" => code_redemption_params}) do
    code_redemption = ActionManagement.get_code_redemption!(id)

    case ActionManagement.update_code_redemption(code_redemption, code_redemption_params) do
      {:ok, code_redemption} ->
        conn
        |> put_flash(:info, "Code redemption updated successfully.")
        |> redirect(to: code_redemption_path(conn, :show, code_redemption))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", code_redemption: code_redemption, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    code_redemption = ActionManagement.get_code_redemption!(id)
    {:ok, _code_redemption} = ActionManagement.delete_code_redemption(code_redemption)

    conn
    |> put_flash(:info, "Code redemption deleted successfully.")
    |> redirect(to: code_redemption_path(conn, :index))
  end
end
