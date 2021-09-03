defmodule Playground.Learnables.Article do
  use Ecto.Schema
  import Ecto.Changeset

  schema "articles" do
    field :title, :string

    field :content_json, :map,
      default: %{
        type: "doc",
        content: [%{type: "paragraph", content: [%{type: "text", content: ""}]}]
      }

    field :content_html, :string

    timestamps()
  end

  @doc false
  def changeset(article, attrs) do
    article
    |> cast(attrs, [:title, :content_json, :content_html])
    |> validate_required([:title, :content_json, :content_html])
  end
end
