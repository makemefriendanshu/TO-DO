defmodule TODO.Agentize do
  defmacro agentize(struct_name) do
    quote do
      defmodule Storage do
        use Agent

        def start_link(_opts \\ []) do
          Agent.start_link(fn -> %{} end, name: unquote(struct_name))
        end

        def put(key, value) when is_map(value) and is_struct(value, unquote(struct_name)) do
          Agent.update(unquote(struct_name), fn state -> Map.put(state, key, value) end)
        end

        def get(key) do
          Agent.get(unquote(struct_name), fn state -> Map.get(state, key) end)
        end

        def delete(key) do
          Agent.update(unquote(struct_name), fn state -> Map.delete(state, key) end)
        end

        def list_users do
          Agent.get(unquote(struct_name), fn state -> Map.values(state) end)
        end
      end
    end
  end
end
