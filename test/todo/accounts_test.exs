defmodule TODO.AccountsTest do
  use TODO.DataCase

  alias TODO.Accounts

  describe "relationships" do
    alias TODO.Accounts.Relationship

    import TODO.AccountsFixtures

    @invalid_attrs %{}

    test "list_relationships/0 returns all relationships" do
      relationship = relationship_fixture()
      assert Accounts.list_relationships() == [relationship]
    end

    test "get_relationship!/1 returns the relationship with given id" do
      relationship = relationship_fixture()
      assert Accounts.get_relationship!(relationship.id) == relationship
    end

    test "create_relationship/1 with valid data creates a relationship" do
      valid_attrs = %{}

      assert {:ok, %Relationship{} = relationship} = Accounts.create_relationship(valid_attrs)
    end

    test "create_relationship/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_relationship(@invalid_attrs)
    end

    test "update_relationship/2 with valid data updates the relationship" do
      relationship = relationship_fixture()
      update_attrs = %{}

      assert {:ok, %Relationship{} = relationship} = Accounts.update_relationship(relationship, update_attrs)
    end

    test "update_relationship/2 with invalid data returns error changeset" do
      relationship = relationship_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_relationship(relationship, @invalid_attrs)
      assert relationship == Accounts.get_relationship!(relationship.id)
    end

    test "delete_relationship/1 deletes the relationship" do
      relationship = relationship_fixture()
      assert {:ok, %Relationship{}} = Accounts.delete_relationship(relationship)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_relationship!(relationship.id) end
    end

    test "change_relationship/1 returns a relationship changeset" do
      relationship = relationship_fixture()
      assert %Ecto.Changeset{} = Accounts.change_relationship(relationship)
    end
  end

  describe "relationship_types" do
    alias TODO.Accounts.RelationshipType

    import TODO.AccountsFixtures

    @invalid_attrs %{name: nil, type: nil}

    test "list_relationship_types/0 returns all relationship_types" do
      relationship_type = relationship_type_fixture()
      assert Accounts.list_relationship_types() == [relationship_type]
    end

    test "get_relationship_type!/1 returns the relationship_type with given id" do
      relationship_type = relationship_type_fixture()
      assert Accounts.get_relationship_type!(relationship_type.id) == relationship_type
    end

    test "create_relationship_type/1 with valid data creates a relationship_type" do
      valid_attrs = %{name: "some name", type: "some type"}

      assert {:ok, %RelationshipType{} = relationship_type} = Accounts.create_relationship_type(valid_attrs)
      assert relationship_type.name == "some name"
      assert relationship_type.type == "some type"
    end

    test "create_relationship_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_relationship_type(@invalid_attrs)
    end

    test "update_relationship_type/2 with valid data updates the relationship_type" do
      relationship_type = relationship_type_fixture()
      update_attrs = %{name: "some updated name", type: "some updated type"}

      assert {:ok, %RelationshipType{} = relationship_type} = Accounts.update_relationship_type(relationship_type, update_attrs)
      assert relationship_type.name == "some updated name"
      assert relationship_type.type == "some updated type"
    end

    test "update_relationship_type/2 with invalid data returns error changeset" do
      relationship_type = relationship_type_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_relationship_type(relationship_type, @invalid_attrs)
      assert relationship_type == Accounts.get_relationship_type!(relationship_type.id)
    end

    test "delete_relationship_type/1 deletes the relationship_type" do
      relationship_type = relationship_type_fixture()
      assert {:ok, %RelationshipType{}} = Accounts.delete_relationship_type(relationship_type)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_relationship_type!(relationship_type.id) end
    end

    test "change_relationship_type/1 returns a relationship_type changeset" do
      relationship_type = relationship_type_fixture()
      assert %Ecto.Changeset{} = Accounts.change_relationship_type(relationship_type)
    end
  end
end
