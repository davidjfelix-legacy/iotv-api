defmodule ApiWeb.PerformanceControllerTest do
  use ApiWeb.ConnCase

  alias Api.VideoContainers
  alias Api.VideoContainers.Performance

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:performance) do
    {:ok, performance} = VideoContainers.create_performance(@create_attrs)
    performance
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all performances", %{conn: conn} do
      conn = get conn, performance_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create performance" do
    test "renders performance when data is valid", %{conn: conn} do
      conn = post conn, performance_path(conn, :create), performance: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, performance_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "name" => "some name"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, performance_path(conn, :create), performance: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update performance" do
    setup [:create_performance]

    test "renders performance when data is valid", %{conn: conn, performance: %Performance{id: id} = performance} do
      conn = put conn, performance_path(conn, :update, performance), performance: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, performance_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "name" => "some updated name"}
    end

    test "renders errors when data is invalid", %{conn: conn, performance: performance} do
      conn = put conn, performance_path(conn, :update, performance), performance: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete performance" do
    setup [:create_performance]

    test "deletes chosen performance", %{conn: conn, performance: performance} do
      conn = delete conn, performance_path(conn, :delete, performance)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, performance_path(conn, :show, performance)
      end
    end
  end

  defp create_performance(_) do
    performance = fixture(:performance)
    {:ok, performance: performance}
  end
end
