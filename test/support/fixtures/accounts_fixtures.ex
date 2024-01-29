defmodule GigalixirGettingStarted.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `GigalixirGettingStarted.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> GigalixirGettingStarted.Accounts.create_user()

    user
  end
end
