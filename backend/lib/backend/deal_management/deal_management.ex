defmodule Backend.DealManagement do
  @moduledoc """
  The DealManagement context.
  """

  import Ecto.Query, warn: false
  alias Backend.Repo

  alias Backend.DealManagement.Deal

  @doc """
  Returns the list of deals.

  ## Examples

      iex> list_deals()
      [%Deal{}, ...]

  """
  def list_deals do
    Repo.all(Deal)
  end

  @doc """
  Gets a single deal.

  Raises `Ecto.NoResultsError` if the Deal does not exist.

  ## Examples

      iex> get_deal!(123)
      %Deal{}

      iex> get_deal!(456)
      ** (Ecto.NoResultsError)

  """
  def get_deal!(id), do: Repo.get!(Deal, id)

  @doc """
  Creates a deal.

  ## Examples

      iex> create_deal(%{field: value})
      {:ok, %Deal{}}

      iex> create_deal(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_deal(attrs \\ %{}) do
    %Deal{}
    |> Deal.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a deal.

  ## Examples

      iex> update_deal(deal, %{field: new_value})
      {:ok, %Deal{}}

      iex> update_deal(deal, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_deal(%Deal{} = deal, attrs) do
    deal
    |> Deal.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Deal.

  ## Examples

      iex> delete_deal(deal)
      {:ok, %Deal{}}

      iex> delete_deal(deal)
      {:error, %Ecto.Changeset{}}

  """
  def delete_deal(%Deal{} = deal) do
    Repo.delete(deal)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking deal changes.

  ## Examples

      iex> change_deal(deal)
      %Ecto.Changeset{source: %Deal{}}

  """
  def change_deal(%Deal{} = deal) do
    Deal.changeset(deal, %{})
  end

  alias Backend.DealManagement.BusinessDeal

  @doc """
  Returns the list of business_deals.

  ## Examples

      iex> list_business_deals()
      [%BusinessDeal{}, ...]

  """
  def list_business_deals do
    Repo.all(BusinessDeal)
  end

  @doc """
  Gets a single business_deal.

  Raises `Ecto.NoResultsError` if the Business deal does not exist.

  ## Examples

      iex> get_business_deal!(123)
      %BusinessDeal{}

      iex> get_business_deal!(456)
      ** (Ecto.NoResultsError)

  """
  def get_business_deal!(id), do: Repo.get!(BusinessDeal, id)

  @doc """
  Creates a business_deal.

  ## Examples

      iex> create_business_deal(%{field: value})
      {:ok, %BusinessDeal{}}

      iex> create_business_deal(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_business_deal(attrs \\ %{}) do
    %BusinessDeal{}
    |> BusinessDeal.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a business_deal.

  ## Examples

      iex> update_business_deal(business_deal, %{field: new_value})
      {:ok, %BusinessDeal{}}

      iex> update_business_deal(business_deal, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_business_deal(%BusinessDeal{} = business_deal, attrs) do
    business_deal
    |> BusinessDeal.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a BusinessDeal.

  ## Examples

      iex> delete_business_deal(business_deal)
      {:ok, %BusinessDeal{}}

      iex> delete_business_deal(business_deal)
      {:error, %Ecto.Changeset{}}

  """
  def delete_business_deal(%BusinessDeal{} = business_deal) do
    Repo.delete(business_deal)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking business_deal changes.

  ## Examples

      iex> change_business_deal(business_deal)
      %Ecto.Changeset{source: %BusinessDeal{}}

  """
  def change_business_deal(%BusinessDeal{} = business_deal) do
    BusinessDeal.changeset(business_deal, %{})
  end
end
