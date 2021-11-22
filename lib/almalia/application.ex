defmodule Almalia.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Almalia.Repo,
      # Start the Telemetry supervisor
      AlmaliaWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Almalia.PubSub},
      # Start the Endpoint (http/https)
      AlmaliaWeb.Endpoint
      # Start a worker by calling: Almalia.Worker.start_link(arg)
      # {Almalia.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Almalia.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    AlmaliaWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
