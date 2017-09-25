defmodule BackendWeb.Router do
  use BackendWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BackendWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController
    resources "/admins", AdminController
    resources "/businesses", BusinessController
    resources "/business_users", BusinessUserController
    resources "/deals", DealController
    resources "/business_deals", BusinessDealController
    resources "/actions", ActionController
    resources "/deal_redemptions", DealRedemptionController
    resources "/code_redemptions", CodeRedemptionController
  end

  # Other scopes may use custom stacks.
  scope "/api", BackendWeb do
    pipe_through :api
  end
end
