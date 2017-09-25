defmodule Backend.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias Backend.Repo

  alias Backend.Accounts.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a User.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}

  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  alias Backend.Accounts.BusinessUser

  @doc """
  Returns the list of business_users.

  ## Examples

      iex> list_business_users()
      [%BusinessUser{}, ...]

  """
  def list_business_users do
    Repo.all(BusinessUser)
  end

  @doc """
  Gets a single business_user.

  Raises `Ecto.NoResultsError` if the Business user does not exist.

  ## Examples

      iex> get_business_user!(123)
      %BusinessUser{}

      iex> get_business_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_business_user!(id), do: Repo.get!(BusinessUser, id)

  @doc """
  Creates a business_user.

  ## Examples

      iex> create_business_user(%{field: value})
      {:ok, %BusinessUser{}}

      iex> create_business_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_business_user(attrs \\ %{}) do
    %BusinessUser{}
    |> BusinessUser.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a business_user.

  ## Examples

      iex> update_business_user(business_user, %{field: new_value})
      {:ok, %BusinessUser{}}

      iex> update_business_user(business_user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_business_user(%BusinessUser{} = business_user, attrs) do
    business_user
    |> BusinessUser.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a BusinessUser.

  ## Examples

      iex> delete_business_user(business_user)
      {:ok, %BusinessUser{}}

      iex> delete_business_user(business_user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_business_user(%BusinessUser{} = business_user) do
    Repo.delete(business_user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking business_user changes.

  ## Examples

      iex> change_business_user(business_user)
      %Ecto.Changeset{source: %BusinessUser{}}

  """
  def change_business_user(%BusinessUser{} = business_user) do
    BusinessUser.changeset(business_user, %{})
  end
end
