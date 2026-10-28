defmodule OpsBoardWeb.CounterLive do
  use OpsBoardWeb, :live_view

  @min 0
  @max 10

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, count: 0, min: @min, max: @max, step: 1)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div id="counter">
      <h1>LiveView Counter</h1>

      <p id="count">Count: {@count}</p>

      <form phx-change="setStep" phx-submit="setStep">
        <input type="number" name="step" value={@step} min="{@min}" max="{@max}" phx-debounce="300" />
      </form>

      <button id="increment" phx-click="increment" disabled={@count >= @max}>
        Increment
      </button>

      <button id="decrement" phx-click="decrement" disabled={@count <= @min}>
        Decrement
      </button>

      <button id="reset" phx-click="reset">
        Reset
      </button>
    </div>
    """
  end

  @impl true
  def handle_event("increment", _params, socket) do
    {:noreply, update(socket, :count, &(&1 + socket.assigns.step))}
  end

  @impl true
  def handle_event("decrement", _params, socket) do
    {:noreply, update(socket, :count, &(&1 - socket.assigns.step))}
  end

  @impl true
  def handle_event("reset", _params, socket) do
    {:noreply, assign(socket, :count, 0)}
  end

  def handle_event("setStep", %{"step" => raw}, socket) do
    step =
      case Integer.parse(raw) do
        {n, _} -> n
        :error -> socket.assigns.step
      end

    {:noreply, assign(socket, :step, step)}
  end
end
