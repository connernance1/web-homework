defmodule HomeworkWeb.Resolvers.CompaniesResolver do
  alias Homework.Companies


  @doc """
  Get a list of companies
  """
  def companies(_root, args, _info) do
    {:ok, Companies.list_companies(args)}
  end

  @doc """
    Converts amount from decimal to Integer
  """
  def decimalToInteger(decimal) do
    amount = trunc(Decimal.to_float(decimal) * 100)
  end


  @doc """
  Create a new company
  """
  def create_company(_root, args, _info) do
    available_credit = decimalToInteger(args.credit_line)

    args = %{args | credit_line: available_credit}
    args = Map.put(args, :availableCredit, available_credit)

    case Companies.create_company(args) do
      {:ok, company} ->
        {:ok, company}

      error ->
        {:error, "could not create company: #{inspect(error)}"}
    end
  end


  @doc """
  Updates a company for an id with args specified.
  """
  def update_company(_root, %{id: id} = args, _info) do
    company = Companies.get_company!(id)

    case Companies.update_company(company, args) do
      {:ok, company} ->
        {:ok, company}

      error ->
        {:error, "could not update company: #{inspect(error)}"}
    end
  end

  @doc """
  Deletes a company for an id
  """
  def delete_company(_root, %{id: id}, _info) do
    company = Companies.get_company!(id)

    case Companies.delete_company(company) do
      {:ok, company} ->
        {:ok, company}


      error ->
        {:error, "could not update company: #{inspect(error)}"}
    end
  end
end
