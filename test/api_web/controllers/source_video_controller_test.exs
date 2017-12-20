defmodule ApiWeb.SourceVideoControllerTest do
  use ApiWeb.ConnCase

  alias Api.Videos
  alias Api.Videos.SourceVideo

  @create_attrs %{url: "some url"}
  @update_attrs %{url: "some updated url"}
  @invalid_attrs %{url: nil}

  def fixture(:source_video) do
    {:ok, source_video} = Videos.create_source_video(@create_attrs)
    source_video
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all source_videos", %{conn: conn} do
      conn = get conn, source_video_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create source_video" do
    test "renders source_video when data is valid", %{conn: conn} do
      conn = post conn, source_video_path(conn, :create), source_video: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, source_video_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "url" => "some url"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, source_video_path(conn, :create), source_video: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update source_video" do
    setup [:create_source_video]

    test "renders source_video when data is valid", %{conn: conn, source_video: %SourceVideo{id: id} = source_video} do
      conn = put conn, source_video_path(conn, :update, source_video), source_video: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, source_video_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "url" => "some updated url"}
    end

    test "renders errors when data is invalid", %{conn: conn, source_video: source_video} do
      conn = put conn, source_video_path(conn, :update, source_video), source_video: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete source_video" do
    setup [:create_source_video]

    test "deletes chosen source_video", %{conn: conn, source_video: source_video} do
      conn = delete conn, source_video_path(conn, :delete, source_video)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, source_video_path(conn, :show, source_video)
      end
    end
  end

  defp create_source_video(_) do
    source_video = fixture(:source_video)
    {:ok, source_video: source_video}
  end
end
