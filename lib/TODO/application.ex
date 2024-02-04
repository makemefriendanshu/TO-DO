defmodule TODO.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      TODOWeb.Telemetry,
      TODO.Repo,
      {DNSCluster, query: Application.get_env(:TODO, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: TODO.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: TODO.Finch},
      # Start a worker by calling: TODO.Worker.start_link(arg)
      # {TODO.Worker, arg},
      # Start to serve requests, typically the last entry
      TODOWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TODO.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TODOWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
