defmodule Storybook.Cards.Summary do
  use PhoenixStorybook.Story, :component

  alias TODOWeb.Cards.Summary

  def function, do: &Summary.summary_card/1

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default summary card function component",
        attributes: %{
          artist: "Miles Davis",
          title: "Kind of Blue",
          summary: "Lorem ipsum dolar set amit"
        }
      }
    ]
  end
end
