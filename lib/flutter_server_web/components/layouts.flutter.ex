defmodule FlutterServerWeb.Layouts.Flutter do
  @moduledoc """
    Mobile layouts
  """
  use FlutterServerNative, [:layout, format: :flutter]

  embed_templates("layouts_flutter/*")
end
