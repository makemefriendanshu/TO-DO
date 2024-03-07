defmodule TODO.Scraper do
  @base_url "https://www.latlong.net"
  @initial_path "/category/towns-102-55.html"

  def run(path \\ @initial_path) do
    dbg(__ENV__.function)
    document = perform_request_and_parse_result(path)

    document
    |> Floki.find("table tr td")
    |> save_rows()

    maybe_paginate(document)
  end

  defp perform_request_and_parse_result("" <> path) do
    dbg(__ENV__.function)

    {:ok, %Finch.Response{body: body}} =
      Finch.build(:get, "#{@base_url}/#{path}")
      |> Finch.request(TODO.Finch)

    {:ok, document} = Floki.parse_document(body)
    document
  end

  defp save_rows(rows) do
    dbg(__ENV__.function)

    rows
    |> parse_places
    |> Enum.each(&TODO.Places.create_place/1)
  end

  defp parse_places(data) when is_list(data) do
    dbg(__ENV__.function)

    data
    |> Enum.chunk_every(3)
    |> Enum.map(fn x ->
      x
      |> Enum.reduce([], fn {_, _, c}, acc ->
        if is_tuple(hd(c)), do: acc ++ (hd(c) |> Tuple.to_list() |> Enum.at(2)), else: acc ++ c
      end)
    end)
    |> Enum.map(fn x ->
      %{
        place: x |> Enum.at(0) |> String.split(",") |> hd,
        state: x |> Enum.at(0) |> String.split(",") |> tl |> Enum.join(","),
        latitude: x |> Enum.at(1),
        longitude: x |> Enum.at(2)
      }
    end)
  end

  defp parse_places(data) do
    dbg(__ENV__.function)

    data
    |> IO.inspect(label: "string")
  end

  defp maybe_paginate(document) do
    dbg(__ENV__.function)

    document
    |> Floki.find(".pagination li a")
    |> Enum.find(fn row ->
      case row do
        {"a", [{"href", "/" <> _path}], ["next" <> _]} -> true
        _ -> false
      end
    end)
    |> case do
      nil ->
        :ok

      {_, [{_, "" <> path}], _} ->
        run(path)
    end
  end
end
