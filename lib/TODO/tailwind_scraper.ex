defmodule TODO.TailwindScraper do
  alias TODO.Repo
  alias TODO.Tailwind.Class

  @base_url "https://tailwind.build"
  # @initial_path "animation/ease-linear+%25_F+.ease-*"
  @initial_path ""

  def start() do
    # dbg(__ENV__.function)

    File.read!("./classes.html")
    # |> IO.inspect(label: "class")
    |> Floki.parse_document!()
    |> Floki.find("a")
    |> parse_page()

    rename_links
  end

  def run(path \\ @initial_path) do
    # dbg(__ENV__.function)

    class =
      ".#{path |> String.split("/") |> Enum.at(2)}"

    body =
      perform_request_and_parse_result(path)
      |> Floki.find(".mb-12")
      |> Enum.map(fn x ->
        Tuple.to_list(x)
        |> get_div_elem
      end)

    File.write("./assets/css/app.css", "\n #{body |> Enum.at(2)}", [:append])

    %{
      name: class,
      text: path,
      # example: x |> Tuple.to_list() |> Enum.at(3),
      elem: body |> Enum.at(2),
      label: body |> Enum.at(0),
      body: body |> Enum.at(1)
    }
    |> TODO.Tailwind.create_class()

    # |> IO.inspect(label: "insert")
  end

  defp get_div_elem(arg) do
    cond do
      arg |> hd == "div" ->
        arg
        |> Enum.at(2)
        |> get_code_elem

      true ->
        nil
    end
  end

  defp get_code_elem(arg) do
    cond do
      length(arg) == 1 ->
        arg
        |> Enum.at(0)
        |> get_elem_from_tuple

      length(arg) == 2 &&
          arg
          |> Enum.at(1)
          |> Tuple.to_list()
          |> Enum.at(1) == [] ->
        arg
        |> Enum.at(1)
        |> Floki.raw_html(pretty: true)

      length(arg) == 2 &&
          arg
          |> Enum.at(1)
          |> Tuple.to_list()
          |> Enum.at(1) != [] ->
        arg
        |> Enum.at(1)
        |> get_elem_from_tuple

      true ->
        nil
    end
  end

  defp get_elem_from_tuple(tuple) do
    tuple
    |> Tuple.to_list()
    |> Enum.at(2)
    |> hd
    |> Tuple.to_list()
    |> Enum.at(2)
    |> hd
    |> Tuple.to_list()
    |> Enum.at(2)
    |> hd
  end

  def perform_request_and_parse_result("" <> path) do
    # dbg(__ENV__.function)

    {:ok, %Finch.Response{body: body}} =
      Finch.build(:get, "#{@base_url}/#{path}")
      |> Finch.request(TODO.Finch)

    {:ok, document} = Floki.parse_document(body)
    document
  end

  defp parse_page(data) when is_list(data) do
    # dbg(__ENV__.function)

    data
    |> IO.inspect(labe: "data")
    |> Enum.chunk_every(3)
    |> IO.inspect(labe: "data2")
    |> Enum.map(fn x ->
      x
      |> Enum.reduce([], fn {_, c, _}, acc ->
        if is_tuple(hd(c)),
          do: acc ++ [hd(c) |> Tuple.to_list() |> Enum.at(1)],
          else: acc ++ (c)
      end)
    end)
    |> List.flatten()
    |> Enum.filter(&String.starts_with?(&1, "/classes"))
    |> Enum.map(&String.slice(&1, 1, String.length(&1)))
    |> Enum.split(568)
    |> Tuple.to_list()
    |> Enum.at(1)
    # |> Enum.random
    # |> run
    |> Enum.map(&run(&1))
  end

  defp parse_page(data) do
    # dbg(__ENV__.function)

    data
  end

  def rename_links do
    office_url = "https://tailwind.build/placeholders/pictures/office.jpg"
    office_local = "/images/office.jpg"
    message_url = "https://tailwind.build/placeholders/icons/message.svg"
    message_local = "/images/message.svg"

    classes = Repo.all(Class)

    {office, ids1, message, ids2} =
      {classes
       |> Enum.filter(&String.contains?(&1.label, office_url))
       |> Enum.map(&String.replace(&1.label, office_url, office_local)),
       classes
       |> Enum.filter(&String.contains?(&1.label, office_url))
       |> Enum.map(& &1.id),
       classes
       |> Enum.filter(&String.contains?(&1.label, message_url))
       |> Enum.map(&String.replace(&1.label, message_url, message_local)),
       classes
       |> Enum.filter(&String.contains?(&1.label, message_url))
       |> Enum.map(& &1.id)}

    ids1
    |> Enum.map(&Repo.get!(Class, &1))
    |> Enum.with_index()
    |> Enum.map(fn {k, v} -> Repo.update!(Class.changeset(k, %{label: office |> Enum.at(v)})) end)

    ids2
    |> Enum.map(&Repo.get!(Class, &1))
    |> Enum.with_index()
    |> Enum.map(fn {k, v} -> Repo.update!(Class.changeset(k, %{label: message |> Enum.at(v)})) end)
    # |> IO.inspect(label: "ids")


    {office, ids1, message, ids2} =
      {classes
       |> Enum.filter(&(not is_nil(&1.body)))
       |> Enum.filter(&String.contains?(&1.body, office_url))
       |> Enum.map(&String.replace(&1.body, office_url, office_local)),
       classes
       |> Enum.filter(&(not is_nil(&1.body)))
       |> Enum.filter(&String.contains?(&1.body, office_url))
       |> Enum.map(& &1.id),
       classes
       |> Enum.filter(&(not is_nil(&1.body)))
       |> Enum.filter(&String.contains?(&1.body, message_url))
       |> Enum.map(&String.replace(&1.body, message_url, message_local)),
       classes
       |> Enum.filter(&(not is_nil(&1.body)))
       |> Enum.filter(&String.contains?(&1.body, message_url))
       |> Enum.map(& &1.id)}

    ids1
    |> Enum.map(&Repo.get!(Class, &1))
    |> Enum.with_index()
    |> Enum.map(fn {k, v} -> Repo.update!(Class.changeset(k, %{body: office |> Enum.at(v)})) end)

    ids2
    |> Enum.map(&Repo.get!(Class, &1))
    |> Enum.with_index()
    |> Enum.map(fn {k, v} -> Repo.update!(Class.changeset(k, %{body: message |> Enum.at(v)})) end)
  end
end
