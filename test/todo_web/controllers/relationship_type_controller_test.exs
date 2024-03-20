defmodule TODOWeb.RelationshipTypeControllerTest do
  use TODOWeb.ConnCase

  import TODO.AccountsFixtures

  alias TODO.Accounts.RelationshipType

  @create_attrs %{
    name: "some name",
    type: "some type"
  }
  @update_attrs %{
    name: "some updated name",
    type: "some updated type"
  }
  @invalid_attrs %{name: nil, type: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all relationship_types", %{conn: conn} do
      conn = get(conn, ~p"/api/relationship_types")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create relationship_type" do
    test "renders relationship_type when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/relationship_types", relationship_type: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/relationship_types/#{id}")

      assert %{
               "id" => ^id,
               "name" => "some name",
               "type" => "some type"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/relationship_types", relationship_type: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update relationship_type" do
    setup [:create_relationship_type]

    test "renders relationship_type when data is valid", %{conn: conn, relationship_type: %RelationshipType{id: id} = relationship_type} do
      conn = put(conn, ~p"/api/relationship_types/#{relationship_type}", relationship_type: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/relationship_types/#{id}")

      assert %{
               "id" => ^id,
               "name" => "some updated name",
               "type" => "some updated type"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, relationship_type: relationship_type} do
      conn = put(conn, ~p"/api/relationship_types/#{relationship_type}", relationship_type: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete relationship_type" do
    setup [:create_relationship_type]

    test "deletes chosen relationship_type", %{conn: conn, relationship_type: relationship_type} do
      conn = delete(conn, ~p"/api/relationship_types/#{relationship_type}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/relationship_types/#{relationship_type}")
      end
    end
  end

  defp create_relationship_type(_) do
    relationship_type = relationship_type_fixture()
    %{relationship_type: relationship_type}
  end
end
