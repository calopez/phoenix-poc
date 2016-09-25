defmodule Rumbl.VideoViewTest do
  use Rumbl.ConnCase, async: true
  import Phoenix.View

  test "renders index.html", %{conn: conn} do
    videos = [
      %Rumbl.Video{id: "1", title: "dogs"},
      %Rumbl.Video{id: "2", title: "cats"},
    ]

    content = render_to_string(Rumbl.VideoView, "index.html", conn: conn, videos: videos)

    assert String.contains?(content, "Listing videos")

    for video <- videos do
      assert String.contains?(content, video.title)
    end
  end


  test "renders new.html", %{conn: conn} do
    changeset = Rumbl.Video.changeset(%Rumbl.Video{}) # url/title/description can't be blank, but this is not important for this test.
    categories = [{"cats", 123}]

    IO.inspect changeset
    content = render_to_string(
      Rumbl.VideoView, "new.html",
      conn: conn,
      changeset: changeset,
      categories: categories
    )
    assert String.contains?(content, "New video")

  end


end
