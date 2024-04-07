defmodule FlutterServerWeb.SecondPageLive.Flutter do
  use FlutterServerNative, [:render_component, format: :flutter]

  alias LiveViewNative.Flutter.Dart

  @impl true
  def render(assigns) do
    ~LVN"""
      <Container padding="16">
        <Text>Second page</Text>
        <ElevatedButton phx-href={~p"/third-page"}>
          <Text>Third Page</Text>
        </ElevatedButton>
        <ElevatedButton phx-href={Dart.go_back()}>
          <Text>GO BACK</Text>
        </ElevatedButton>
      </Container>
    """
  end
end
