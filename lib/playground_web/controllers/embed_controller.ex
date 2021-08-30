defmodule PlaygroundWeb.EmbedController do
  use PlaygroundWeb, :controller

  def index(conn, %{"id" => id}) do
    json(conn, %{html: "<div>embed met id: #{id}</div>"})
  end
end
