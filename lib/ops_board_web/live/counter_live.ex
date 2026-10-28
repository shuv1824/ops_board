defmodule OpsBoardWeb.CounterLive do
  use OpsBoardWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :count, 0)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div id="counter">
      <h1>LiveView Counter</h1>

      <p id="count">Count: {@count}</p>

      <button id="increment" phx-click="increment">
        Increment
      </button>

      <button id="decrement" phx-click="decrement">
        Decrement
      </button>
    </div>
    """
  end

  @impl true
  def handle_event("increment", _params, socket) do
    {:noreply, update(socket, :count, &(&1 + 1))}
  end

  @impl true
  def handle_event("decrement", _params, socket) do
    {:noreply, update(socket, :count, &(&1 - 1))}
  end
end
