defmodule FlutterServerWeb.LoginLive.Flutter do
  use FlutterServerNative, [:render_component, format: :flutter]

  @impl true
  def render(assigns) do
    ~LVN"""
      <Text>Login page</Text>
    """
  end
end
