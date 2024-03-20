defmodule TODOWeb.TaskTestLive.Index do
  use TODOWeb, :live_view
  require Logger

  @impl true
  def mount(_params, _session, socket) do
    # Trap exits to catch when a Task is forcibly cancelled.
    Process.flag(:trap_exit, true)

    socket =
      socket
      |> assign(:running_task, nil)
      |> assign(:messages, [])

    {:ok, socket}
  end

  @impl true
  def handle_event("start", _params, socket) do
    socket =
      socket
      |> assign(:messages, [])
      |> start_test_task()

    {:noreply, socket}
  end

  def handle_event("cancel", _params, socket) do
    task_id = socket.assigns.running_task

    socket =
      if task_id do
        Process.exit(task_id, :kill)
        # display it was cancelled.
        put_flash(socket, :info, "Cancelled")
      else
        socket
      end

    {:noreply, socket}
  end

  @impl true
  def handle_info({:task_message, message}, socket) do
    socket =
      socket
      |> assign(:messages, [message | socket.assigns.messages])

    {:noreply, socket}
  end

  def handle_info({:EXIT, pid, _reason}, socket) do
    socket =
      if pid == socket.assigns.running_task do
        # Do any cleanup needed

        socket
        |> assign(:running_task, nil)
      else
        socket
      end

    {:noreply, socket}
  end

  def start_test_task(socket) do
    live_view_pid = self()

    {:ok, task_pid} =
      Task.start_link(fn ->
        # the code to run async
        Enum.each(1..5, fn n ->
          Process.sleep(1_000)
          send(live_view_pid, {:task_message, "Async work chunk #{n}"})
        end)

        # function result discarded -- it isn't used
        :ok
      end)

    # returning the socket so it's pipe-friendly
    assign(socket, :running_task, task_pid)
  end
end
