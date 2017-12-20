defmodule ApiWeb.VideoSegmentControllerTest do
  use ApiWeb.ConnCase

  alias Api.Videos
  alias Api.Videos.VideoSegment

  @create_attrs %{url: "some url"}
  @update_attrs %{url: "some updated url"}
  @invalid_attrs %{url: nil}

  def fixture(:video_segment) do
    {:ok, video_segment} = Videos.create_video_segment(@create_attrs)
    video_segment
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all video_segments", %{conn: conn} do
      conn = get conn, video_segment_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create video_segment" do
    test "renders video_segment when data is valid", %{conn: conn} do
      conn = post conn, video_segment_path(conn, :create), video_segment: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, video_segment_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "url" => "some url"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, video_segment_path(conn, :create), video_segment: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update video_segment" do
    setup [:create_video_segment]

    test "renders video_segment when data is valid", %{conn: conn, video_segment: %VideoSegment{id: id} = video_segment} do
      conn = put conn, video_segment_path(conn, :update, video_segment), video_segment: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, video_segment_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "url" => "some updated url"}
    end

    test "renders errors when data is invalid", %{conn: conn, video_segment: video_segment} do
      conn = put conn, video_segment_path(conn, :update, video_segment), video_segment: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete video_segment" do
    setup [:create_video_segment]

    test "deletes chosen video_segment", %{conn: conn, video_segment: video_segment} do
      conn = delete conn, video_segment_path(conn, :delete, video_segment)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, video_segment_path(conn, :show, video_segment)
      end
    end
  end

  defp create_video_segment(_) do
    video_segment = fixture(:video_segment)
    {:ok, video_segment: video_segment}
  end
end
