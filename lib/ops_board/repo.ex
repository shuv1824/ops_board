defmodule OpsBoard.Repo do
  use Ecto.Repo,
    otp_app: :ops_board,
    adapter: Ecto.Adapters.Postgres
end
