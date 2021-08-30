defmodule Playground.LearnablesTest do
  use Playground.DataCase

  alias Playground.Learnables

  describe "articles" do
    alias Playground.Learnables.Article

    import Playground.LearnablesFixtures

    @invalid_attrs %{content_html: nil, content_json: nil, title: nil}

    test "list_articles/0 returns all articles" do
      article = article_fixture()
      assert Learnables.list_articles() == [article]
    end

    test "get_article!/1 returns the article with given id" do
      article = article_fixture()
      assert Learnables.get_article!(article.id) == article
    end

    test "create_article/1 with valid data creates an article" do
      valid_attrs = %{
        content_html: "<p>some content</p>",
        content_json: %{
          type: "doc",
          content: [%{type: "paragraph", content: [%{type: "text", text: "some content"}]}]
        },
        title: "some title"
      }

      assert {:ok, %Article{} = article} = Learnables.create_article(valid_attrs)
      assert article.content_html == "<p>some content</p>"

      assert article.content_json == %{
               type: "doc",
               content: [%{type: "paragraph", content: [%{type: "text", text: "some content"}]}]
             }

      assert article.title == "some title"
    end

    test "create_article/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Learnables.create_article(@invalid_attrs)
    end

    test "update_article/2 with valid data updates the article" do
      article = article_fixture()

      update_attrs = %{
        content_html: "<p>some updated content</p>",
        content_json: %{
          type: "doc",
          content: [
            %{type: "paragraph", content: [%{type: "text", text: "some updated content"}]}
          ]
        },
        title: "some updated title"
      }

      assert {:ok, %Article{} = article} = Learnables.update_article(article, update_attrs)
      assert article.content_html == "<p>some updated content_html</p>"

      assert article.content_json == %{
               type: "doc",
               content: [
                 %{type: "paragraph", content: [%{type: "text", text: "some updated content"}]}
               ]
             }

      assert article.title == "some updated title"
    end

    test "update_article/2 with invalid data returns error changeset" do
      article = article_fixture()
      assert {:error, %Ecto.Changeset{}} = Learnables.update_article(article, @invalid_attrs)
      assert article == Learnables.get_article!(article.id)
    end

    test "delete_article/1 deletes the article" do
      article = article_fixture()
      assert {:ok, %Article{}} = Learnables.delete_article(article)
      assert_raise Ecto.NoResultsError, fn -> Learnables.get_article!(article.id) end
    end

    test "change_article/1 returns an article changeset" do
      article = article_fixture()
      assert %Ecto.Changeset{} = Learnables.change_article(article)
    end
  end
end
