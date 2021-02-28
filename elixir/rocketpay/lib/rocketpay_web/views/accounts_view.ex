defmodule RocketpayWeb.AccountsView do
  alias Rocketpay.Account

  def render("update.json", %{account: %Account{id: account_id, balance: balance}}) do
    %{
      message: "Account updated",
      account: %{
        id: account_id,
        balance: balance
      }
    }
  end

  def render("transaction.json", %{
        transaction: %{
          from_account: %Account{} = from_account,
          to_account: %Account{} = to_account
        }
      }) do
    %{
      message: "Transaction done successfully",
      transaction: %{
        from_account: %{
          id: from_account.id,
          balance: from_account.balance
        },
        to_account: %{
          id: to_account.id,
          balance: to_account.balance
        }
      }
    }
  end
end
