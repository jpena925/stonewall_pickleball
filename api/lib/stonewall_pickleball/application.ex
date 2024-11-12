defmodule StonewallPickleball.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      StonewallPickleballWeb.Telemetry,
      StonewallPickleball.Repo,
      {DNSCluster, query: Application.get_env(:stonewall_pickleball, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: StonewallPickleball.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: StonewallPickleball.Finch},
      # Start a worker by calling: StonewallPickleball.Worker.start_link(arg)
      # {StonewallPickleball.Worker, arg},
      # Start to serve requests, typically the last entry
      StonewallPickleballWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: StonewallPickleball.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    StonewallPickleballWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
