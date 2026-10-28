defmodule OpsBoardWeb.CounterLiveTest do
  use OpsBoardWeb.ConnCase, async: true

  import Phoenix.LiveViewTest

  test "incrementing updates the count", %{conn: conn} do
    {:ok, view, html} = live(conn, ~p"/lab/counter")

    assert html =~ "Count: 0"

    result = view |> element("#increment") |> render_click()

    assert result =~ "Count: 1"
  end
end
