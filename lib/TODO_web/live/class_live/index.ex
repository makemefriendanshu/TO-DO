defmodule TODOWeb.ClassLive.Index do
  use TODOWeb, :live_view

  alias TODO.Tailwind
  alias TODO.Tailwind.Class

  @impl true
  def mount(_params, _session, socket) do
    classes = Tailwind.list_class()

    sections =
      classes
      |> Enum.map(fn x -> x |> Map.get(:text) |> String.split("/") |> Enum.at(1) end)
      |> Enum.uniq()
      |> Enum.filter(&(not is_nil(&1)))
      |> Enum.map(fn x -> "#{x} (#{count_elements(classes, x)})" end)
      |> Enum.map(&String.capitalize(&1))
      |> List.insert_at(0, "All (#{classes |> length})")

    {:ok,
     stream(
       socket
       |> assign(:sections, sections),
       :class_collection,
       classes
     )}
  end

  defp count_elements(classes, name) do
    classes
    |> Enum.map(fn x -> x |> Map.get(:text) |> String.split("/") |> Enum.at(1) end)
    |> Enum.filter(&(not is_nil(&1)))
    |> Enum.count(&String.equivalent?(&1, name))
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Class")
    |> assign(:class, Tailwind.get_class!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Class")
    |> assign(:class, %Class{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Class")
    |> assign(:class, nil)
  end

  @impl true
  def handle_info({TODOWeb.ClassLive.FormComponent, {:saved, class}}, socket) do
    {:noreply, stream_insert(socket, :class_collection, class)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    class = Tailwind.get_class!(id)
    {:ok, _} = Tailwind.delete_class(class)

    {:noreply, stream_delete(socket, :class_collection, class)}
  end

  @impl true
  def handle_event("show_class_list", %{"param" => class_name}, socket) do
    classes = Tailwind.list_class()

    ui_classes =
      case String.contains?(class_name, "All") do
        true ->
          classes

        _ ->
          classes
          |> Enum.filter(
            &(&1 |> Map.get(:text) |> String.split("/") |> Enum.at(1) ==
                class_name |> String.downcase |> String.split |> hd)
          )
      end

    {:noreply, stream(socket, :class_collection, ui_classes, reset: true)}
  end

  @impl true
  def handle_event("load_styles", _, socket) do
    TODO.TailwindScraper.start()
    {:noreply, stream(socket, :class_collection, Tailwind.list_class(), reset: true)}
  end
end
