defmodule Playground.LearnablesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Playground.Learnables` context.
  """

  @doc """
  Generate an article.
  """
  def article_fixture(attrs \\ %{}) do
    {:ok, article} =
      attrs
      |> Enum.into(%{
        content_html: "<p>some content</p>",
        content_json: %{
          type: "doc",
          content: [%{type: "paragraph", content: [%{type: "text", text: "some content"}]}]
        },
        title: "some title"
      })
      |> Playground.Learnables.create_article()

    article
  end
end
