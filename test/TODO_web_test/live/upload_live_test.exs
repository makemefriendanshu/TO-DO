defmodule TODOWebTest.Live.UploadLiveTest do
  import PhoenixTest
  alias TODO.Repo
  use ExUnit.Case
  # Ecto.Adapters.SQL.Sandbox.mode(TODO.Repo, :manual)
  Ecto.Adapters.SQL.Sandbox.start_owner!(TODO.Repo, shared: true)

  setup_all do
    {:ok, email: "anshumannie@gmail.com", password: "Riya&1234567"}
  end

  # test "can create a user" do
  #   Phoenix.ConnTest.build_conn()
  #   # <- could be LiveView or static page
  #   |> visit("/")
  #   # |> open_browser()
  #   # <- navigate between LiveViews and static pages
  #   |> click_link("Register")
  #   |> fill_form("#registration_form", user: %{email: "anshumanniex@gmail.com", password: "Riya&1234567"})
  #   |> open_browser()
  #   # ^ will trigger `phx-change` if present
  #   # <- submits LiveView forms and regular forms
  #   |> click_button("Create an account")

  #   Process.sleep(2000)

  #   x
  #   |> open_browser()
  #   # |> IO.inspect(label: "test")
  #   # <- provides better error messages
  #   |> assert_has("p", "User not confirmed")
  # end

  test "user can login", state do
    Phoenix.ConnTest.build_conn()
    # <- could be LiveView or static page
    |> visit("/")
    # |> open_browser()
    # <- navigate between LiveViews and static pages
    |> click_link("Log in")
    |> fill_form("#login_form", user: %{email: state[:email], password: state[:password]})
    # ^ will trigger `phx-change` if present
    # <- submits LiveView forms and regular forms
    |> click_button("Sign in")
    # |> open_browser()
    # |> IO.inspect(label: "test")
    # <- provides better error messages
    |> assert_has("a", "Log out")
  end
end
