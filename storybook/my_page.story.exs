defmodule Storybook.MyPage do
  use PhoenixStorybook.Story, :page

  def doc, do: "My page description"

  def navigation do
    [
      {:tab_one, "Tab One", {:fa, "book"}},
      {:tab_two, "Tab Two", {:fa, "cake", :solid}}
    ]
  end

  def render(assigns) do
    ~H"<div>Your HEEX template</div>"
  end
end
