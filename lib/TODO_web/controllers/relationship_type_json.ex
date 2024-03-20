defmodule TODOWeb.RelationshipTypeJSON do
  alias TODO.Accounts.RelationshipType

  @doc """
  Renders a list of relationship_types.
  """
  def index(%{relationship_types: relationship_types}) do
    %{data: for(relationship_type <- relationship_types, do: data(relationship_type))}
  end

  @doc """
  Renders a single relationship_type.
  """
  def show(%{relationship_type: relationship_type}) do
    %{data: data(relationship_type)}
  end

  defp data(%RelationshipType{} = relationship_type) do
    %{
      id: relationship_type.id,
      name: relationship_type.name,
      type: relationship_type.type
    }
  end
end
