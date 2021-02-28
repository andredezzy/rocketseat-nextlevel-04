defmodule RocketpayWeb.UsersViewTest do
  use RocketpayWeb.ConnCase, async: true

  import Phoenix.View

  alias Rocketpay.{User, Account}
  alias RocketpayWeb.UsersView

  test "renders create.json" do
    params = %{
      name: "André",
      nickname: "andredezzy",
      age: 18,
      email: "oi@andrevictor.me",
      password: "123456"
    }

    {:ok, %User{id: user_id, account: %Account{id: account_id}} = user} =
      Rocketpay.create_user(params)

    response = render(UsersView, "create.json", user: user)

    expected_response = %{
      message: "User created",
      user: %{
        account: %{
          id: account_id,
          balance: Decimal.new("0.00")
        },
        id: user_id,
        name: "André",
        nickname: "andredezzy"
      }
    }

    assert expected_response == response
  end
end
