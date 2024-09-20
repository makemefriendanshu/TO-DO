defmodule TODOWeb.Router do
  use TODOWeb, :router
  # import PhoenixStorybook.Router

  import TODOWeb.UserAuth

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_live_flash)
    plug(:put_root_layout, html: {TODOWeb.Layouts, :root})
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
    plug(:fetch_current_user)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  # Other scopes may use custom stacks.
  # scope "/api", TODOWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  # if Application.compile_env(:todo, :dev_routes) do
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  import Phoenix.LiveDashboard.Router

  # scope "/" do
  #   storybook_assets()
  # end

  scope "/dev" do
    pipe_through(:browser)

    live_dashboard("/dashboard", metrics: TODOWeb.Telemetry)
    forward("/mailbox", Plug.Swoosh.MailboxPreview)
  end

  # end

  ## Authentication routes

  scope "/", TODOWeb do
    pipe_through([:browser, :redirect_if_user_is_authenticated])

    live_session :redirect_if_user_is_authenticated,
      on_mount: [{TODOWeb.UserAuth, :redirect_if_user_is_authenticated}] do
      live("/users/register", UserRegistrationLive, :new)
      live("/users/log_in", UserLoginLive, :new)
      live("/users/reset_password", UserForgotPasswordLive, :new)
      live("/users/reset_password/:token", UserResetPasswordLive, :edit)
    end

    post("/users/log_in", UserSessionController, :create)
  end

  scope "/", TODOWeb do
    pipe_through([:browser, :require_authenticated_user])

    live_session :require_authenticated_user,
      on_mount: [{TODOWeb.UserAuth, :ensure_authenticated}] do
      live("/users/settings", UserSettingsLive, :edit)
      live("/users/settings/confirm_email/:token", UserSettingsLive, :confirm_email)
    end
  end

  scope "/", TODOWeb do
    pipe_through([:browser])

    get("/tailwind", PageController, :home)
    # live_storybook("/storybook", backend_module: TODOWeb.Storybook)
    delete("/users/log_out", UserSessionController, :delete)

    live_session :current_user,
      on_mount: [{TODOWeb.UserAuth, :mount_current_user}] do
      live("/users/confirm/:token", UserConfirmationLive, :edit)
      live("/users/confirm", UserConfirmationInstructionsLive, :new)
      live("/uploads", UploaderLive, :index)

      # live "/places", PlaceLive.Index, :index
      # live "/places/new", PlaceLive.Index, :new
      # live "/places/:id/edit", PlaceLive.Index, :edit
      # live "/places/:id", PlaceLive.Show, :show
      # live "/places/:id/show/edit", PlaceLive.Show, :edit

      live "/", ClassLive.Index, :index
      live "/class/new", ClassLive.Index, :new
      live "/class/:id/edit", ClassLive.Index, :edit
      live "/class/:id", ClassLive.Show, :show
      live "/class/:id/show/edit", ClassLive.Show, :edit
    end
  end

  scope "/", TODOWeb do
    pipe_through([:browser])

    live_session :require_admin_user,
      on_mount: [{TODOWeb.UserAuth, :ensure_authenticated}] do
      live("/users", UserLive.Index, :index)
      live("/users/new", UserLive.Index, :new)
      live("/users/:id/edit", UserLive.Index, :edit)
      live("/users/:id", UserLive.Show, :show)
      live("/users/:id/show/edit", UserLive.Show, :edit)
    end
  end

  scope "/camera", TODOWeb do
    pipe_through :browser

    get "/", CamController, :index

    resources "/uploads", UploadController, only: [:new, :create]
    get "/webcam", WebcamController, :index
  end
end
