# defmodule TODOWebTest.Features.AdminCanCreateUserTest do
#   import PhoenixTest
#   alias TODO.Repo
#   use ExUnit.Case
#   # Ecto.Adapters.SQL.Sandbox.mode(TODO.Repo, :manual)
#   Ecto.Adapters.SQL.Sandbox.start_owner!(TODO.Repo, shared: true)

#   test "admin can create user" do
#     Phoenix.ConnTest.build_conn()
#     |> visit("/")
#     |> click_link("Uploads")
#     |> fill_form("#upload-form", "uploads.avatar.ref": "phx-F7jvnwfMKTep8gBF-9")
#     |> click_button("Upload")
#     |> assert_has(".user", "Anshuman")
#   end
# end

# # <input data-phx-id="phx-F7jvnwfMKTep8gBF-9" id="phx-F7jvnxypXCBp2QFB" type="file" name="avatar" data-phx-hook="Phoenix.LiveFileUpload" data-phx-update="ignore" data-phx-upload-ref="phx-F7jvnxypXCBp2QFB" data-phx-active-refs="1" data-phx-done-refs="" data-phx-preflighted-refs="" class="text-black bg-blue-400 dark:bg-blue-500 sfont-medium rounded-lg text-sm px-5 py-2.5 text-center">
# # <input id="phx-F7jzeBZiZPImEwSD" type="file" name="avatar" data-phx-hook="Phoenix.LiveFileUpload" data-phx-update="ignore" data-phx-upload-ref="phx-F7jzeBZiZPImEwSD" data-phx-active-refs="" data-phx-done-refs="" data-phx-preflighted-refs="" class="text-black bg-blue-400 dark:bg-blue-500 sfont-medium rounded-lg text-sm px-5 py-2.5 text-center"/>
