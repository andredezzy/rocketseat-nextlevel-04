defmodule Rocketpay.Users.CreateTest do
  use Rocketpay.DataCase, async: true

  alias Rocketpay.User

  describe "call/1" do
    test "when all params are valid, returns an user" do
      params = %{
        name: "André",
        nickname: "andredezzy",
        age: 18,
        email: "oi@andrevictor.me",
        password: "123456"
      }

      {:ok, %User{id: user_id}} = Rocketpay.create_user(params)
      user = Repo.get(User, user_id)

      assert %User{name: "André", age: 18, id: ^user_id} = user
    end

    test "when there are invalid params, returns an error" do
      params = %{
        name: "André",
        nickname: "andredezzy",
        age: 17,
        email: "oi@andrevictor.me"
      }

      {:error, changeset} = Rocketpay.create_user(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["can't be blank"]
      }

      assert errors_on(changeset) == expected_response
    end
  end
end
