defmodule Rumbl.WatchController do
  use Rumbl.Web, :controller
  alias Rumbl.Video

  def show(conn, %{"id" => id}) do
    video = Video |> Repo.get!(id)
    render conn, "show.html", video: video
  end

end
