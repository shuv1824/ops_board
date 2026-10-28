defmodule OpsBoardWeb.PageController do
  use OpsBoardWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
