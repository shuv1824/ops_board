defmodule OpsBoard.Application do
  # See https://elixir.hexdocs.pm/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      OpsBoardWeb.Telemetry,
      OpsBoard.Repo,
      {DNSCluster, query: Application.get_env(:ops_board, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: OpsBoard.PubSub},
      # Start a worker by calling: OpsBoard.Worker.start_link(arg)
      # {OpsBoard.Worker, arg},
      # Start to serve requests, typically the last entry
      OpsBoardWeb.Endpoint
    ]

    # See https://elixir.hexdocs.pm/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: OpsBoard.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    OpsBoardWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
