defmodule TODO.Array do
  @moduledoc """
  An Elixir Array implementation for simple get/set operations.
  """
  @default :undefined
  @leafsize 10
  @nodesize @leafsize

  defstruct [:size, :max, :elements, default: @default]

  def from_list(list) do
    {_,b,c,d,e} = :array.from_list(list)
    %__MODULE__{max: c, size: b, default: d, elements: e}
  end

  def get(index, array) when is_integer(index) and index >= 0 do
    cond do
      index < array.size -> get_1(index, array.elements, array.default)
      array.max > 0 -> array.default
      true -> :erlang.error(:badarg)
    end
  end

  defp get_1(index, {_, _, _, _, _, _, _, _, _, _, s} = elements, default) do
    {index, elements, default, s}
    |> IO.inspect(label: "label")

    rem_index = rem(index, s)
    elem_index = div(index, s) + 1
    element = :erlang.element(elem_index, elements)

    {rem_index, elements, element}
    |> IO.inspect(label: "label2")

    get_1(rem_index, element, default)
  end

  defp get_1(_index, elements, default) when is_integer(elements), do: default
  defp get_1(index, elements, _D), do: :erlang.element(index + 1, elements)
end
