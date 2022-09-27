defmodule Lookatgen.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Lookatgen.Repo,
      # Start the Telemetry supervisor
      LookatgenWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Lookatgen.PubSub},
      # Start the Endpoint (http/https)
      LookatgenWeb.Endpoint
      # Start a worker by calling: Lookatgen.Worker.start_link(arg)
      # {Lookatgen.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Lookatgen.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LookatgenWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
