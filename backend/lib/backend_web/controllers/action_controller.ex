defmodule BackendWeb.ActionController do
  use BackendWeb, :controller

  alias Backend.ActionManagement
  alias Backend.ActionManagement.Action

  def index(conn, _params) do
    actions = ActionManagement.list_actions()
    render(conn, "index.html", actions: actions)
  end

  def new(conn, _params) do
    changeset = ActionManagement.change_action(%Action{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"action" => action_params}) do
    case ActionManagement.create_action(action_params) do
      {:ok, action} ->
        conn
        |> put_flash(:info, "Action created successfully.")
        |> redirect(to: action_path(conn, :show, action))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    action = ActionManagement.get_action!(id)
    render(conn, "show.html", action: action)
  end

  def edit(conn, %{"id" => id}) do
    action = ActionManagement.get_action!(id)
    changeset = ActionManagement.change_action(action)
    render(conn, "edit.html", action: action, changeset: changeset)
  end

  def update(conn, %{"id" => id, "action" => action_params}) do
    action = ActionManagement.get_action!(id)

    case ActionManagement.update_action(action, action_params) do
      {:ok, action} ->
        conn
        |> put_flash(:info, "Action updated successfully.")
        |> redirect(to: action_path(conn, :show, action))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", action: action, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    action = ActionManagement.get_action!(id)
    {:ok, _action} = ActionManagement.delete_action(action)

    conn
    |> put_flash(:info, "Action deleted successfully.")
    |> redirect(to: action_path(conn, :index))
  end
end
