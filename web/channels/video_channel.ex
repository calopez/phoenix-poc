defmodule Rumbl.VideoChannel do
  use Rumbl.Web, :channel

  def join("videos:" <> video_id, _params, socket) do
    :timer.send_interval(5_000, :ping)
    {:ok, socket}
  end

  @doc"""
  This function will handle all incoming messages to a channel, pushed directly from the remote client
  """
  def handle_in("new_annotation", params, socket) do
    # we are not persisting to the DB yet.
    # simply broadcast! new_annotation to all the clients on this topic
    broadcast! socket, "new_annotation", %{
      user: %{username: "anonymous"},
      body: params["body"],
      at: params["at"]
    }
    {:reply, :ok, socket}
  end


end
