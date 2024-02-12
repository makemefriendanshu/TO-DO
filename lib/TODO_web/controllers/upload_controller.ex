defmodule TODOWeb.UploadController do
  use TODOWeb, :controller_without_live

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{"upload" => upload}=_params) do
    data = File.read!(upload.path)
    detection = TODO.Worker.request_detection(TODO.Worker, data) |> TODO.Worker.await()

    base64_image = base64_inline_image(data, upload.content_type)
    render(conn, "show.html", image: base64_image, detection: detection)
  end

  defp base64_inline_image(data, content_type) do
    image64 = Base.encode64(data)
    "data:#{content_type};base64, #{image64}"
  end
end
