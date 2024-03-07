defmodule TODOWeb.Storybook.Components.Button do
  alias TODOWeb.CoreComponents


  # :live_component or :page are also available
  use PhoenixStorybook.Story, :component

  def function, do: &CoreComponents.button/1


  def variations do [
    %Variation{
      id: :default,
      attributes: %{
        type: "A button",
        class: "",
        # rest: "",
        inner_block: []
      }
    },
    %Variation{
      id: :green_button,
      attributes: %{
        type: "Still a button",
        class: "green",
        # rest: "",
        inner_block: []
      }
    }
  ]
  end
end
