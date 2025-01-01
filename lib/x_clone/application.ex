defmodule XClone.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      XCloneWeb.Telemetry,
      XClone.Repo,
      {DNSCluster, query: Application.get_env(:x_clone, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: XClone.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: XClone.Finch},
      # Start a worker by calling: XClone.Worker.start_link(arg)
      # {XClone.Worker, arg},
      # Start to serve requests, typically the last entry
      XCloneWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: XClone.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    XCloneWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
