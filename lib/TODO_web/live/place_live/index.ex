# defmodule TODOWeb.PlaceLive.Index do
#   # alias ElixirSense.Core.Struct
#   use TODOWeb, :live_view

#   alias TODO.Places
#   alias TODO.Places.Place

#   @impl true
#   def mount(_params, _session, socket) do
#     places = Places.list_places()
#     socket =
#       socket
#       |> push_event("add_places", hd(places)|> Map.from_struct |> Map.delete(:__meta__))

#     result =
#         Tucan.heatmap(:weather, "date", "date", "temp_max",
#           x: [time_unit: :date],
#           y: [time_unit: :month],
#           color: [aggregate: :mean]
#         )
#         |> Tucan.set_title("Heatmap of Avg Max Temperatures in Seattle (2012-2015)")
#         |> Tucan.Axes.set_x_title("Day")
#         |> Tucan.Axes.set_y_title("Month")
#         |> Tucan.Legend.set_title(:color, "Avg Max Temp")

#     {:ok, socket |> assign(:result, result) |> stream(socket, :places, places)}
#   end

#   @impl true
#   def handle_params(params, _url, socket) do
#     {:noreply, apply_action(socket, socket.assigns.live_action, params)}
#   end

#   defp apply_action(socket, :edit, %{"id" => id}) do
#     socket
#     |> assign(:page_title, "Edit Place")
#       |> assign(:place, Places.get_place!(id))
#   end

#   defp apply_action(socket, :new, _params) do
#     socket
#     |> assign(:page_title, "New Place")
#     |> assign(:place, %Place{})
#   end

#   defp apply_action(socket, :index, _params) do
#     socket
#     |> assign(:page_title, "Listing Places")
#     |> assign(:place, nil)
#   end

#   @impl true
#   def handle_info({TODOWeb.PlaceLive.FormComponent, {:saved, place}}, socket) do
#     {:noreply, stream_insert(socket, :places, place)}
#   end

#   @impl true
#   def handle_event("delete", %{"id" => id}, socket) do
#     place = Places.get_place!(id)
#     {:ok, _} = Places.delete_place(place)

#     {:noreply, stream_delete(socket, :places, place)}
#   end

#   def handle_event("delete_all", _, socket) do
#     Places.delete_all_places()
#     {:noreply, stream(socket, :places, [], reset: true)}
#   end

#   def handle_event("load_places", _, socket) do
#     TODO.Scraper.run()
#     {:noreply, stream(socket, :places, Places.list_places(), reset: true)}
#   end
# end
