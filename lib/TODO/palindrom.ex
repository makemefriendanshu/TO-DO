defmodule TODO.Palindrom do
  def run(string) do
    res =
    0..String.length(string)
    |> Enum.map(fn x ->
      0..String.length(string) - 1
      |> Enum.reduce([], fn y, acc ->
        [
          %{
            item: String.slice(string, x, y),
            count: String.length(String.slice(string, x, y)),
            is_p: String.slice(string, x, y) == String.reverse(String.slice(string, x, y))
          }
          | acc
        ]
      end)
    end)
    |> List.flatten()
    |> IO.inspect(label: "label")

    count =
      res
      |> Enum.filter(& &1.is_p)
      |> Enum.map(& &1.count)
      |> Enum.max()

    res
    |> Enum.filter(& &1.is_p && &1.count == count)
    |> Enum.uniq()
    |> hd

  end
end
