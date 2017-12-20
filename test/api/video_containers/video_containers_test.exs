defmodule Api.VideoContainersTest do
  use Api.DataCase

  alias Api.VideoContainers

  describe "playlists" do
    alias Api.VideoContainers.Playlist

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def playlist_fixture(attrs \\ %{}) do
      {:ok, playlist} =
        attrs
        |> Enum.into(@valid_attrs)
        |> VideoContainers.create_playlist()

      playlist
    end

    test "list_playlists/0 returns all playlists" do
      playlist = playlist_fixture()
      assert VideoContainers.list_playlists() == [playlist]
    end

    test "get_playlist!/1 returns the playlist with given id" do
      playlist = playlist_fixture()
      assert VideoContainers.get_playlist!(playlist.id) == playlist
    end

    test "create_playlist/1 with valid data creates a playlist" do
      assert {:ok, %Playlist{} = playlist} = VideoContainers.create_playlist(@valid_attrs)
      assert playlist.name == "some name"
    end

    test "create_playlist/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = VideoContainers.create_playlist(@invalid_attrs)
    end

    test "update_playlist/2 with valid data updates the playlist" do
      playlist = playlist_fixture()
      assert {:ok, playlist} = VideoContainers.update_playlist(playlist, @update_attrs)
      assert %Playlist{} = playlist
      assert playlist.name == "some updated name"
    end

    test "update_playlist/2 with invalid data returns error changeset" do
      playlist = playlist_fixture()
      assert {:error, %Ecto.Changeset{}} = VideoContainers.update_playlist(playlist, @invalid_attrs)
      assert playlist == VideoContainers.get_playlist!(playlist.id)
    end

    test "delete_playlist/1 deletes the playlist" do
      playlist = playlist_fixture()
      assert {:ok, %Playlist{}} = VideoContainers.delete_playlist(playlist)
      assert_raise Ecto.NoResultsError, fn -> VideoContainers.get_playlist!(playlist.id) end
    end

    test "change_playlist/1 returns a playlist changeset" do
      playlist = playlist_fixture()
      assert %Ecto.Changeset{} = VideoContainers.change_playlist(playlist)
    end
  end

  describe "performances" do
    alias Api.VideoContainers.Performance

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def performance_fixture(attrs \\ %{}) do
      {:ok, performance} =
        attrs
        |> Enum.into(@valid_attrs)
        |> VideoContainers.create_performance()

      performance
    end

    test "list_performances/0 returns all performances" do
      performance = performance_fixture()
      assert VideoContainers.list_performances() == [performance]
    end

    test "get_performance!/1 returns the performance with given id" do
      performance = performance_fixture()
      assert VideoContainers.get_performance!(performance.id) == performance
    end

    test "create_performance/1 with valid data creates a performance" do
      assert {:ok, %Performance{} = performance} = VideoContainers.create_performance(@valid_attrs)
      assert performance.name == "some name"
    end

    test "create_performance/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = VideoContainers.create_performance(@invalid_attrs)
    end

    test "update_performance/2 with valid data updates the performance" do
      performance = performance_fixture()
      assert {:ok, performance} = VideoContainers.update_performance(performance, @update_attrs)
      assert %Performance{} = performance
      assert performance.name == "some updated name"
    end

    test "update_performance/2 with invalid data returns error changeset" do
      performance = performance_fixture()
      assert {:error, %Ecto.Changeset{}} = VideoContainers.update_performance(performance, @invalid_attrs)
      assert performance == VideoContainers.get_performance!(performance.id)
    end

    test "delete_performance/1 deletes the performance" do
      performance = performance_fixture()
      assert {:ok, %Performance{}} = VideoContainers.delete_performance(performance)
      assert_raise Ecto.NoResultsError, fn -> VideoContainers.get_performance!(performance.id) end
    end

    test "change_performance/1 returns a performance changeset" do
      performance = performance_fixture()
      assert %Ecto.Changeset{} = VideoContainers.change_performance(performance)
    end
  end

  describe "series" do
    alias Api.VideoContainers.Series

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def series_fixture(attrs \\ %{}) do
      {:ok, series} =
        attrs
        |> Enum.into(@valid_attrs)
        |> VideoContainers.create_series()

      series
    end

    test "list_series/0 returns all series" do
      series = series_fixture()
      assert VideoContainers.list_series() == [series]
    end

    test "get_series!/1 returns the series with given id" do
      series = series_fixture()
      assert VideoContainers.get_series!(series.id) == series
    end

    test "create_series/1 with valid data creates a series" do
      assert {:ok, %Series{} = series} = VideoContainers.create_series(@valid_attrs)
      assert series.name == "some name"
    end

    test "create_series/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = VideoContainers.create_series(@invalid_attrs)
    end

    test "update_series/2 with valid data updates the series" do
      series = series_fixture()
      assert {:ok, series} = VideoContainers.update_series(series, @update_attrs)
      assert %Series{} = series
      assert series.name == "some updated name"
    end

    test "update_series/2 with invalid data returns error changeset" do
      series = series_fixture()
      assert {:error, %Ecto.Changeset{}} = VideoContainers.update_series(series, @invalid_attrs)
      assert series == VideoContainers.get_series!(series.id)
    end

    test "delete_series/1 deletes the series" do
      series = series_fixture()
      assert {:ok, %Series{}} = VideoContainers.delete_series(series)
      assert_raise Ecto.NoResultsError, fn -> VideoContainers.get_series!(series.id) end
    end

    test "change_series/1 returns a series changeset" do
      series = series_fixture()
      assert %Ecto.Changeset{} = VideoContainers.change_series(series)
    end
  end
end
