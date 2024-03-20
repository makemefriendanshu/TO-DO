defmodule TODO.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TODO.Accounts` context.
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
      |> TODO.Accounts.create_user()

    user
  end

  def unique_user_email, do: "user#{System.unique_integer()}@example.com"
  def valid_user_password, do: "hello world!"

  def valid_user_attributes(attrs \\ %{}) do
    Enum.into(attrs, %{
      email: unique_user_email(),
      password: valid_user_password()
    })
  end

  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> valid_user_attributes()
      |> TODO.Accounts.register_user()

    user
  end

  def extract_user_token(fun) do
    {:ok, captured_email} = fun.(&"[TOKEN]#{&1}[TOKEN]")
    [_, token | _] = String.split(captured_email.text_body, "[TOKEN]")
    token
  end

  @doc """
  Generate a relationship.
  """
  def relationship_fixture(attrs \\ %{}) do
    {:ok, relationship} =
      attrs
      |> Enum.into(%{

      })
      |> TODO.Accounts.create_relationship()

    relationship
  end

  @doc """
  Generate a relationship_type.
  """
  def relationship_type_fixture(attrs \\ %{}) do
    {:ok, relationship_type} =
      attrs
      |> Enum.into(%{
        name: "some name",
        type: "some type"
      })
      |> TODO.Accounts.create_relationship_type()

    relationship_type
  end
end
