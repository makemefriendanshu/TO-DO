# defmodule TODOWebTest.FeatureCase do
#   @moduledoc """
#   This module defines the test case to be used by tests that require setting up
#   a connection to test feature tests.

#   Such tests rely on `PhoenixTest` and also import other functionality to
#   make it easier to build common data structures and interact with pages.

#   Finally, if the test case interacts with the database, we enable the SQL
#   sandbox, so changes done to the database are reverted at the end of every
#   test. If you are using PostgreSQL, you can even run database tests
#   asynchronously by setting `use TODOWeb.FeatureCase, async: true`, although
#   this option is not recommended for other databases.
#   """

#   use ExUnit.CaseTemplate

#   using do
#     quote do
#        # The default endpoint for testing
#        @endpoint TODOWeb.Endpoint
#        # Import conveniences for testing with connections
#        import Plug.Conn

#       use TODOWeb, :verified_routes

#       import TODOWeb.FeatureCase

#       import PhoenixTest
#     end
#   end

#   setup tags do
#     pid = Ecto.Adapters.SQL.Sandbox.start_owner!(TODO.Repo, shared: not tags[:async])
#     on_exit(fn -> Ecto.Adapters.SQL.Sandbox.stop_owner(pid) end)

#     {:ok, conn: Phoenix.ConnTest.build_conn()}
#   end
# end
