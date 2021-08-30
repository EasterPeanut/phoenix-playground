defmodule PlaygroundWeb.Router do
  use PlaygroundWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {PlaygroundWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PlaygroundWeb do
    pipe_through :browser

    get "/", ArticleController, :index

    resources "/articles", ArticleController, except: [:index]
  end

  # Other scopes may use custom stacks.
  # scope "/api", PlaygroundWeb do
  #   pipe_through :api
  # end
end
