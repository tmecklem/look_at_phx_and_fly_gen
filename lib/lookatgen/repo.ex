defmodule Lookatgen.Repo do
  use Ecto.Repo,
    otp_app: :lookatgen,
    adapter: Ecto.Adapters.Postgres
end
