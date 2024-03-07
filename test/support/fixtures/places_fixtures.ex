defmodule TODO.PlacesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TODO.Places` context.
  """

  @doc """
  Generate a place.
  """
  def place_fixture(attrs \\ %{}) do
    {:ok, place} =
      attrs
      |> Enum.into(%{
        latitude: 120.5,
        longitude: 120.5,
        place: "some place",
        state: "some state"
      })
      |> TODO.Places.create_place()

    place
  end
end
