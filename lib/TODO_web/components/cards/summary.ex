defmodule TODOWeb.Cards.Summary do
  use Phoenix.Component

  def summary_card(assigns) do
    ~H"""
    <div class="block max-w-sm p-6 bg-white border border-gray-200 rounded-lg shadow hover:bg-gray-100 dark:bg-gray-800 dark:border-gray-700 dark:hover:bg-gray-700">
    <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white">
    <%= @title %> by <%= @artist %>
    </h5>
    <p class="font-normal text-gray-700 dark:text-gray-400">
    <%= @summary %>
    </p>
    </div>
    """
  end
end
