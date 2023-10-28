defmodule FlutterServerWeb.SecondPageLive do
  use Phoenix.LiveView
  use LiveViewNative.LiveView
  alias LiveViewNativeFlutter.Dart

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, menu: 0)}
  end

  @impl true
  def handle_event("toast", _, socket) do
    {:noreply, socket |> put_flash(:error, "hello")}
  end

  def render(%{platform_id: :flutter} = assigns) do
    # This UI renders on flutter
    ~FLUTTER"""
      <flutter>
        <AppBar>
          <title>
            <Row>
              <CachedNetworkImage imageUrl="/images/logo.png" width="50" height="50" />
              Menu counter : <%= @menu %>
            </Row>
          </title>
        </AppBar>
        <viewBody>
          <Stack>
            <Positioned left={30} top={30}>
              <Text :if={Phoenix.Flash.get(@flash, :error)}>teste</Text>
            </Positioned>
            <Center>
              <Column>
                <Text style="textTheme: bodyLarge; fontWeight: bold">Second page</Text>
                <ElevatedButton phx-click={Dart.go_back()}>go backeee</ElevatedButton>
                <ElevatedButton phx-click="toast">error toast</ElevatedButton>
              </Column>
            </Center>
          </Stack>
        </viewBody>
        <NavigationRail labelType="all" selectedIndex="1"
          phx-onload={Dart.show()}
          phx-onload-when="window_width >= 600"
          phx-window-resize={Dart.show()}
          phx-window-resize-when="window_width >= 600">
          <NavigationRailDestination live-patch="/">
            <label>Page 1</label>
            <Icon name="home" as="icon" />
          </NavigationRailDestination>
          <NavigationRailDestination>
            <label>Page 2</label>
            <Icon name="home" as="icon" />
          </NavigationRailDestination>
          <NavigationRailDestination>
            <label>Increment</label>
            <Icon name="arrow_upward" as="icon" />
          </NavigationRailDestination>
          <NavigationRailDestination>
            <label>Decrement</label>
            <Icon name="arrow_downward" as="icon" />
          </NavigationRailDestination>
        </NavigationRail>
        <BottomNavigationBar
              phx-onload={Dart.hide()}
              phx-onload-when="window_width > 600"
              phx-window-resize={Dart.hide()}
              phx-window-resize-when="window_width > 600"
              currentIndex="1"
              selectedItemColor="blue-500">
          <BottomNavigationBarIcon live-patch="/" name={"home"} label={"Page 1"} />
          <BottomNavigationBarIcon  name={"work"} label={"Page 2"} />
          <BottomNavigationBarIcon name="arrow_upward" label="Increment" />
          <BottomNavigationBarIcon name="arrow_downward" label="Decrement" />
        </BottomNavigationBar>
      </flutter>
    """
  end

  @impl true
  def render(%{} = assigns) do
    # This UI renders on the web
    ~H"""
    <div class="flex w-full h-screen items-center justify-center" phx-click="toast">
      Second page
    </div>
    """
  end
end
