defmodule TODO.TailwindTest do
  use TODO.DataCase

  alias TODO.Tailwind

  describe "class" do
    alias TODO.Tailwind.Class

    import TODO.TailwindFixtures

    @invalid_attrs %{name: nil, text: nil, example: nil}

    test "list_class/0 returns all class" do
      class = class_fixture()
      assert Tailwind.list_class() == [class]
    end

    test "get_class!/1 returns the class with given id" do
      class = class_fixture()
      assert Tailwind.get_class!(class.id) == class
    end

    test "create_class/1 with valid data creates a class" do
      valid_attrs = %{name: "some name", text: "some text", example: "some example"}

      assert {:ok, %Class{} = class} = Tailwind.create_class(valid_attrs)
      assert class.name == "some name"
      assert class.text == "some text"
      assert class.example == "some example"
    end

    test "create_class/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tailwind.create_class(@invalid_attrs)
    end

    test "update_class/2 with valid data updates the class" do
      class = class_fixture()
      update_attrs = %{name: "some updated name", text: "some updated text", example: "some updated example"}

      assert {:ok, %Class{} = class} = Tailwind.update_class(class, update_attrs)
      assert class.name == "some updated name"
      assert class.text == "some updated text"
      assert class.example == "some updated example"
    end

    test "update_class/2 with invalid data returns error changeset" do
      class = class_fixture()
      assert {:error, %Ecto.Changeset{}} = Tailwind.update_class(class, @invalid_attrs)
      assert class == Tailwind.get_class!(class.id)
    end

    test "delete_class/1 deletes the class" do
      class = class_fixture()
      assert {:ok, %Class{}} = Tailwind.delete_class(class)
      assert_raise Ecto.NoResultsError, fn -> Tailwind.get_class!(class.id) end
    end

    test "change_class/1 returns a class changeset" do
      class = class_fixture()
      assert %Ecto.Changeset{} = Tailwind.change_class(class)
    end
  end
end
