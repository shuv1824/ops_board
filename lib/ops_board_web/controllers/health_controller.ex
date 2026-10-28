defmodule OpsBoardWeb.HealthController do
  use OpsBoardWeb, :controller

  def index(conn, _params) do
    json(conn, %{
      status: "ok",
      service: "OpsBoard"
    })
  end
end
