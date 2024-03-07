defmodule TODO.Places.Place do
  use Ecto.Schema
  import Ecto.Changeset

  schema "places" do
    field :state, :string
    field :place, :string
    field :latitude, :float
    field :longitude, :float

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(place, attrs) do
    place
    |> cast(attrs, [:place, :state, :latitude, :longitude])
    |> validate_required([:place, :state, :latitude, :longitude])
  end
end
