defmodule StonewallPickleball.Repo do
  use Ecto.Repo,
    otp_app: :stonewall_pickleball,
    adapter: Ecto.Adapters.Postgres
end
