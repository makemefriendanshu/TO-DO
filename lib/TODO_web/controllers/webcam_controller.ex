defmodule TODOWeb.WebcamController do
  use TODOWeb, :controller_without_live

  def index(conn, _params) do
    render(conn, "index.html")
  end

end
