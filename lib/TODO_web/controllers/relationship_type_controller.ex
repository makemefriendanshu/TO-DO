defmodule TODOWeb.RelationshipTypeController do
  use TODOWeb, :controller

  alias TODO.Accounts
  alias TODO.Accounts.RelationshipType
  alias TODOWeb.RelationshipTypeJSON

  action_fallback TODOWeb.FallbackController

  plug :put_view, html: RelationshipTypeJSON

  def index(conn, _params) do
    relationship_types = Accounts.list_relationship_types()
    render(conn, "index.json", relationship_types: relationship_types)
  end

  def create(conn, %{"relationship_type" => relationship_type_params}) do
    with {:ok, %RelationshipType{} = relationship_type} <- Accounts.create_relationship_type(relationship_type_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/relationship_types/#{relationship_type}")
      |> render("show.json", relationship_type: relationship_type)
    end
  end

  def show(conn, %{"id" => id}) do
    relationship_type = Accounts.get_relationship_type!(id)
    render(conn, "show.json", relationship_type: relationship_type)
  end

  def update(conn, %{"id" => id, "relationship_type" => relationship_type_params}) do
    relationship_type = Accounts.get_relationship_type!(id)

    with {:ok, %RelationshipType{} = relationship_type} <- Accounts.update_relationship_type(relationship_type, relationship_type_params) do
      render(conn, "show.json", relationship_type: relationship_type)
    end
  end

  def delete(conn, %{"id" => id}) do
    relationship_type = Accounts.get_relationship_type!(id)

    with {:ok, %RelationshipType{}} <- Accounts.delete_relationship_type(relationship_type) do
      send_resp(conn, :no_content, "")
    end
  end
end
