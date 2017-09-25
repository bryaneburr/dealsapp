defmodule Backend.ActionManagement do
  @moduledoc """
  The ActionManagement context.
  """

  import Ecto.Query, warn: false
  alias Backend.Repo

  alias Backend.ActionManagement.Action

  @doc """
  Returns the list of actions.

  ## Examples

      iex> list_actions()
      [%Action{}, ...]

  """
  def list_actions do
    Repo.all(Action)
  end

  @doc """
  Gets a single action.

  Raises `Ecto.NoResultsError` if the Action does not exist.

  ## Examples

      iex> get_action!(123)
      %Action{}

      iex> get_action!(456)
      ** (Ecto.NoResultsError)

  """
  def get_action!(id), do: Repo.get!(Action, id)

  @doc """
  Creates a action.

  ## Examples

      iex> create_action(%{field: value})
      {:ok, %Action{}}

      iex> create_action(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_action(attrs \\ %{}) do
    %Action{}
    |> Action.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a action.

  ## Examples

      iex> update_action(action, %{field: new_value})
      {:ok, %Action{}}

      iex> update_action(action, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_action(%Action{} = action, attrs) do
    action
    |> Action.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Action.

  ## Examples

      iex> delete_action(action)
      {:ok, %Action{}}

      iex> delete_action(action)
      {:error, %Ecto.Changeset{}}

  """
  def delete_action(%Action{} = action) do
    Repo.delete(action)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking action changes.

  ## Examples

      iex> change_action(action)
      %Ecto.Changeset{source: %Action{}}

  """
  def change_action(%Action{} = action) do
    Action.changeset(action, %{})
  end

  alias Backend.ActionManagement.DealRedemption

  @doc """
  Returns the list of deal_redemptions.

  ## Examples

      iex> list_deal_redemptions()
      [%DealRedemption{}, ...]

  """
  def list_deal_redemptions do
    Repo.all(DealRedemption)
  end

  @doc """
  Gets a single deal_redemption.

  Raises `Ecto.NoResultsError` if the Deal redemption does not exist.

  ## Examples

      iex> get_deal_redemption!(123)
      %DealRedemption{}

      iex> get_deal_redemption!(456)
      ** (Ecto.NoResultsError)

  """
  def get_deal_redemption!(id), do: Repo.get!(DealRedemption, id)

  @doc """
  Creates a deal_redemption.

  ## Examples

      iex> create_deal_redemption(%{field: value})
      {:ok, %DealRedemption{}}

      iex> create_deal_redemption(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_deal_redemption(attrs \\ %{}) do
    %DealRedemption{}
    |> DealRedemption.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a deal_redemption.

  ## Examples

      iex> update_deal_redemption(deal_redemption, %{field: new_value})
      {:ok, %DealRedemption{}}

      iex> update_deal_redemption(deal_redemption, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_deal_redemption(%DealRedemption{} = deal_redemption, attrs) do
    deal_redemption
    |> DealRedemption.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a DealRedemption.

  ## Examples

      iex> delete_deal_redemption(deal_redemption)
      {:ok, %DealRedemption{}}

      iex> delete_deal_redemption(deal_redemption)
      {:error, %Ecto.Changeset{}}

  """
  def delete_deal_redemption(%DealRedemption{} = deal_redemption) do
    Repo.delete(deal_redemption)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking deal_redemption changes.

  ## Examples

      iex> change_deal_redemption(deal_redemption)
      %Ecto.Changeset{source: %DealRedemption{}}

  """
  def change_deal_redemption(%DealRedemption{} = deal_redemption) do
    DealRedemption.changeset(deal_redemption, %{})
  end

  alias Backend.ActionManagement.CodeRedemption

  @doc """
  Returns the list of code_redemptions.

  ## Examples

      iex> list_code_redemptions()
      [%CodeRedemption{}, ...]

  """
  def list_code_redemptions do
    Repo.all(CodeRedemption)
  end

  @doc """
  Gets a single code_redemption.

  Raises `Ecto.NoResultsError` if the Code redemption does not exist.

  ## Examples

      iex> get_code_redemption!(123)
      %CodeRedemption{}

      iex> get_code_redemption!(456)
      ** (Ecto.NoResultsError)

  """
  def get_code_redemption!(id), do: Repo.get!(CodeRedemption, id)

  @doc """
  Creates a code_redemption.

  ## Examples

      iex> create_code_redemption(%{field: value})
      {:ok, %CodeRedemption{}}

      iex> create_code_redemption(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_code_redemption(attrs \\ %{}) do
    %CodeRedemption{}
    |> CodeRedemption.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a code_redemption.

  ## Examples

      iex> update_code_redemption(code_redemption, %{field: new_value})
      {:ok, %CodeRedemption{}}

      iex> update_code_redemption(code_redemption, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_code_redemption(%CodeRedemption{} = code_redemption, attrs) do
    code_redemption
    |> CodeRedemption.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a CodeRedemption.

  ## Examples

      iex> delete_code_redemption(code_redemption)
      {:ok, %CodeRedemption{}}

      iex> delete_code_redemption(code_redemption)
      {:error, %Ecto.Changeset{}}

  """
  def delete_code_redemption(%CodeRedemption{} = code_redemption) do
    Repo.delete(code_redemption)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking code_redemption changes.

  ## Examples

      iex> change_code_redemption(code_redemption)
      %Ecto.Changeset{source: %CodeRedemption{}}

  """
  def change_code_redemption(%CodeRedemption{} = code_redemption) do
    CodeRedemption.changeset(code_redemption, %{})
  end
end
