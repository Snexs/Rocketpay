defmodule Rocketpay.Accounts.Withdrawl do
  alias Rocketpay.Accounts.Operation
  alias Rocketpay.Repo

  def call(params) do
     params
      |> Operation.call(:withdrawl)
      |> run_transaction()
  end

  defp run_transaction(multi) do
    case Repo.transaction(multi) do
      {:error, _operation,reason,_changes} -> {:error, reason}
      {:ok, %{withdrawl: account}} -> {:ok, account}
    end
  end

end
