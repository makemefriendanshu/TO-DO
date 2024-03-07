defmodule TODOWeb.Presence do
  use Phoenix.Presence,
    otp_app: :todo,
    pubsub_server: TODO.PubSub
end
