defmodule KantoxShoppingcart.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      KantoxShoppingcartWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:kantox_shoppingcart, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: KantoxShoppingcart.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: KantoxShoppingcart.Finch},
      # Start a worker by calling: KantoxShoppingcart.Worker.start_link(arg)
      # {KantoxShoppingcart.Worker, arg},
      # Start to serve requests, typically the last entry
      KantoxShoppingcartWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: KantoxShoppingcart.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    KantoxShoppingcartWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
