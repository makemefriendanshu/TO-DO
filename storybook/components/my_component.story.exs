# storybook/my_component.story.exs
defmodule TODOWeb.Storybook.MyComponent do
  use PhoenixStorybook.Story, :component
  def container, do: :iframe
  def function() do
    nil
  end
end
