defmodule BackendWeb.BusinessUserController do
  use BackendWeb, :controller

  alias Backend.Accounts
  alias Backend.Accounts.BusinessUser

  def index(conn, _params) do
    business_users = Accounts.list_business_users()
    render(conn, "index.html", business_users: business_users)
  end

  def new(conn, _params) do
    changeset = Accounts.change_business_user(%BusinessUser{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"business_user" => business_user_params}) do
    case Accounts.create_business_user(business_user_params) do
      {:ok, business_user} ->
        conn
        |> put_flash(:info, "Business user created successfully.")
        |> redirect(to: business_user_path(conn, :show, business_user))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    business_user = Accounts.get_business_user!(id)
    render(conn, "show.html", business_user: business_user)
  end

  def edit(conn, %{"id" => id}) do
    business_user = Accounts.get_business_user!(id)
    changeset = Accounts.change_business_user(business_user)
    render(conn, "edit.html", business_user: business_user, changeset: changeset)
  end

  def update(conn, %{"id" => id, "business_user" => business_user_params}) do
    business_user = Accounts.get_business_user!(id)

    case Accounts.update_business_user(business_user, business_user_params) do
      {:ok, business_user} ->
        conn
        |> put_flash(:info, "Business user updated successfully.")
        |> redirect(to: business_user_path(conn, :show, business_user))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", business_user: business_user, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    business_user = Accounts.get_business_user!(id)
    {:ok, _business_user} = Accounts.delete_business_user(business_user)

    conn
    |> put_flash(:info, "Business user deleted successfully.")
    |> redirect(to: business_user_path(conn, :index))
  end
end
