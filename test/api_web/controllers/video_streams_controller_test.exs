defmodule ApiWeb.VideoStreamsControllerTest do
  use ApiWeb.ConnCase

  alias Api.Videos
  alias Api.Videos.VideoStreams

  @create_attrs %{url: "some url"}
  @update_attrs %{url: "some updated url"}
  @invalid_attrs %{url: nil}

  def fixture(:video_streams) do
    {:ok, video_streams} = Videos.create_video_streams(@create_attrs)
    video_streams
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all video_streams", %{conn: conn} do
      conn = get conn, video_streams_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create video_streams" do
    test "renders video_streams when data is valid", %{conn: conn} do
      conn = post conn, video_streams_path(conn, :create), video_streams: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, video_streams_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "url" => "some url"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, video_streams_path(conn, :create), video_streams: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update video_streams" do
    setup [:create_video_streams]

    test "renders video_streams when data is valid", %{conn: conn, video_streams: %VideoStreams{id: id} = video_streams} do
      conn = put conn, video_streams_path(conn, :update, video_streams), video_streams: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, video_streams_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "url" => "some updated url"}
    end

    test "renders errors when data is invalid", %{conn: conn, video_streams: video_streams} do
      conn = put conn, video_streams_path(conn, :update, video_streams), video_streams: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete video_streams" do
    setup [:create_video_streams]

    test "deletes chosen video_streams", %{conn: conn, video_streams: video_streams} do
      conn = delete conn, video_streams_path(conn, :delete, video_streams)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, video_streams_path(conn, :show, video_streams)
      end
    end
  end

  defp create_video_streams(_) do
    video_streams = fixture(:video_streams)
    {:ok, video_streams: video_streams}
  end
end
