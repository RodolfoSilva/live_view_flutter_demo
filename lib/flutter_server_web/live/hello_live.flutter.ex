defmodule FlutterServerWeb.HelloLive.Flutter do
  use FlutterServerNative, [:render_component, format: :flutter]
  import FlutterServerWeb.HelloLive

  alias LiveViewNative.Flutter.Dart

  @impl true
  def render(assigns) do
    # This UI renders on flutter
    ~LVN"""
      <Text>First page</Text>
    """
  end

  slot :inner_block

  def text(assigns) do
    ~LVN"""
      <Text>
        <%= render_slot(@inner_block) %>
      </Text>
    """
  end
end
