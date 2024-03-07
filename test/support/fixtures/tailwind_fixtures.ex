defmodule TODO.TailwindFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TODO.Tailwind` context.
  """

  @doc """
  Generate a class.
  """
  def class_fixture(attrs \\ %{}) do
    {:ok, class} =
      attrs
      |> Enum.into(%{
        example: "some example",
        name: "some name",
        text: "some text"
      })
      |> TODO.Tailwind.create_class()

    class
  end
end
