defmodule TODO.SchemaChecker do
  alias TODO.Repo

  def schema_modules do
    {:ok, modules} = :application.get_key(:todo, :modules)

    modules
    |> Enum.filter(&({:__schema__, 1} in &1.__info__(:functions)))
    |> Enum.filter(&(:__meta__ in Map.keys(&1.__schema__(:loaded))))
  end

  def check_module(module) do
    fields =
      module.__schema__(:fields)
      |> Enum.map(&module.__schema__(:field_source, &1))
      |> Enum.map(&Atom.to_string/1)

    table_name = module.__schema__(:source)

    {:ok, %{columns: columns}} = Repo.query("SELECT * FROM #{table_name} LIMIT 0")

    {module, (columns -- fields)}
  end
end
