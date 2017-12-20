defmodule ApiWeb.VideoStreamControllerTest do
  use ApiWeb.ConnCase

  alias Api.Videos
  alias Api.Videos.VideoStream

  @create_attrs %{url: "some url"}
  @update_attrs %{url: "some updated url"}
  @invalid_attrs %{url: nil}

  def fixture(:video_stream) do
    {:ok, video_stream} = Videos.create_video_stream(@create_attrs)
    video_stream
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all video_streams", %{conn: conn} do
      conn = get conn, video_stream_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create video_stream" do
    test "renders video_stream when data is valid", %{conn: conn} do
      conn = post conn, video_stream_path(conn, :create), video_stream: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, video_stream_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "url" => "some url"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, video_stream_path(conn, :create), video_stream: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update video_stream" do
    setup [:create_video_stream]

    test "renders video_stream when data is valid", %{conn: conn, video_stream: %VideoStream{id: id} = video_stream} do
      conn = put conn, video_stream_path(conn, :update, video_stream), video_stream: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, video_stream_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "url" => "some updated url"}
    end

    test "renders errors when data is invalid", %{conn: conn, video_stream: video_stream} do
      conn = put conn, video_stream_path(conn, :update, video_stream), video_stream: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete video_stream" do
    setup [:create_video_stream]

    test "deletes chosen video_stream", %{conn: conn, video_stream: video_stream} do
      conn = delete conn, video_stream_path(conn, :delete, video_stream)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, video_stream_path(conn, :show, video_stream)
      end
    end
  end

  defp create_video_stream(_) do
    video_stream = fixture(:video_stream)
    {:ok, video_stream: video_stream}
  end
end
