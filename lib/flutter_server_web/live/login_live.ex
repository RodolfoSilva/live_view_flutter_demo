defmodule FlutterServerWeb.LoginLive do
  use FlutterServerWeb, :live_view
  use FlutterServerNative, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, menu: 0)}
  end

  @impl true
  def render(assigns) do
    # This UI renders on flutter
    ~H"""
    <div class="flex w-full h-screen items-center justify-center">
      Login page
    </div>
    """
  end
end
