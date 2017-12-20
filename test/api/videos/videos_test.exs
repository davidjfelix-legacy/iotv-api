defmodule Api.VideosTest do
  use Api.DataCase

  alias Api.Videos

  describe "source_videos" do
    alias Api.Videos.SourceVideo

    @valid_attrs %{url: "some url"}
    @update_attrs %{url: "some updated url"}
    @invalid_attrs %{url: nil}

    def source_video_fixture(attrs \\ %{}) do
      {:ok, source_video} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Videos.create_source_video()

      source_video
    end

    test "list_source_videos/0 returns all source_videos" do
      source_video = source_video_fixture()
      assert Videos.list_source_videos() == [source_video]
    end

    test "get_source_video!/1 returns the source_video with given id" do
      source_video = source_video_fixture()
      assert Videos.get_source_video!(source_video.id) == source_video
    end

    test "create_source_video/1 with valid data creates a source_video" do
      assert {:ok, %SourceVideo{} = source_video} = Videos.create_source_video(@valid_attrs)
      assert source_video.url == "some url"
    end

    test "create_source_video/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Videos.create_source_video(@invalid_attrs)
    end

    test "update_source_video/2 with valid data updates the source_video" do
      source_video = source_video_fixture()
      assert {:ok, source_video} = Videos.update_source_video(source_video, @update_attrs)
      assert %SourceVideo{} = source_video
      assert source_video.url == "some updated url"
    end

    test "update_source_video/2 with invalid data returns error changeset" do
      source_video = source_video_fixture()
      assert {:error, %Ecto.Changeset{}} = Videos.update_source_video(source_video, @invalid_attrs)
      assert source_video == Videos.get_source_video!(source_video.id)
    end

    test "delete_source_video/1 deletes the source_video" do
      source_video = source_video_fixture()
      assert {:ok, %SourceVideo{}} = Videos.delete_source_video(source_video)
      assert_raise Ecto.NoResultsError, fn -> Videos.get_source_video!(source_video.id) end
    end

    test "change_source_video/1 returns a source_video changeset" do
      source_video = source_video_fixture()
      assert %Ecto.Changeset{} = Videos.change_source_video(source_video)
    end
  end

  describe "video_segments" do
    alias Api.Videos.VideoSegment

    @valid_attrs %{url: "some url"}
    @update_attrs %{url: "some updated url"}
    @invalid_attrs %{url: nil}

    def video_segment_fixture(attrs \\ %{}) do
      {:ok, video_segment} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Videos.create_video_segment()

      video_segment
    end

    test "list_video_segments/0 returns all video_segments" do
      video_segment = video_segment_fixture()
      assert Videos.list_video_segments() == [video_segment]
    end

    test "get_video_segment!/1 returns the video_segment with given id" do
      video_segment = video_segment_fixture()
      assert Videos.get_video_segment!(video_segment.id) == video_segment
    end

    test "create_video_segment/1 with valid data creates a video_segment" do
      assert {:ok, %VideoSegment{} = video_segment} = Videos.create_video_segment(@valid_attrs)
      assert video_segment.url == "some url"
    end

    test "create_video_segment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Videos.create_video_segment(@invalid_attrs)
    end

    test "update_video_segment/2 with valid data updates the video_segment" do
      video_segment = video_segment_fixture()
      assert {:ok, video_segment} = Videos.update_video_segment(video_segment, @update_attrs)
      assert %VideoSegment{} = video_segment
      assert video_segment.url == "some updated url"
    end

    test "update_video_segment/2 with invalid data returns error changeset" do
      video_segment = video_segment_fixture()
      assert {:error, %Ecto.Changeset{}} = Videos.update_video_segment(video_segment, @invalid_attrs)
      assert video_segment == Videos.get_video_segment!(video_segment.id)
    end

    test "delete_video_segment/1 deletes the video_segment" do
      video_segment = video_segment_fixture()
      assert {:ok, %VideoSegment{}} = Videos.delete_video_segment(video_segment)
      assert_raise Ecto.NoResultsError, fn -> Videos.get_video_segment!(video_segment.id) end
    end

    test "change_video_segment/1 returns a video_segment changeset" do
      video_segment = video_segment_fixture()
      assert %Ecto.Changeset{} = Videos.change_video_segment(video_segment)
    end
  end

  describe "video_streams" do
    alias Api.Videos.VideoStreams

    @valid_attrs %{url: "some url"}
    @update_attrs %{url: "some updated url"}
    @invalid_attrs %{url: nil}

    def video_streams_fixture(attrs \\ %{}) do
      {:ok, video_streams} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Videos.create_video_streams()

      video_streams
    end

    test "list_video_streams/0 returns all video_streams" do
      video_streams = video_streams_fixture()
      assert Videos.list_video_streams() == [video_streams]
    end

    test "get_video_streams!/1 returns the video_streams with given id" do
      video_streams = video_streams_fixture()
      assert Videos.get_video_streams!(video_streams.id) == video_streams
    end

    test "create_video_streams/1 with valid data creates a video_streams" do
      assert {:ok, %VideoStreams{} = video_streams} = Videos.create_video_streams(@valid_attrs)
      assert video_streams.url == "some url"
    end

    test "create_video_streams/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Videos.create_video_streams(@invalid_attrs)
    end

    test "update_video_streams/2 with valid data updates the video_streams" do
      video_streams = video_streams_fixture()
      assert {:ok, video_streams} = Videos.update_video_streams(video_streams, @update_attrs)
      assert %VideoStreams{} = video_streams
      assert video_streams.url == "some updated url"
    end

    test "update_video_streams/2 with invalid data returns error changeset" do
      video_streams = video_streams_fixture()
      assert {:error, %Ecto.Changeset{}} = Videos.update_video_streams(video_streams, @invalid_attrs)
      assert video_streams == Videos.get_video_streams!(video_streams.id)
    end

    test "delete_video_streams/1 deletes the video_streams" do
      video_streams = video_streams_fixture()
      assert {:ok, %VideoStreams{}} = Videos.delete_video_streams(video_streams)
      assert_raise Ecto.NoResultsError, fn -> Videos.get_video_streams!(video_streams.id) end
    end

    test "change_video_streams/1 returns a video_streams changeset" do
      video_streams = video_streams_fixture()
      assert %Ecto.Changeset{} = Videos.change_video_streams(video_streams)
    end
  end

  describe "videos" do
    alias Api.Videos.Video

    @valid_attrs %{title: "some title"}
    @update_attrs %{title: "some updated title"}
    @invalid_attrs %{title: nil}

    def video_fixture(attrs \\ %{}) do
      {:ok, video} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Videos.create_video()

      video
    end

    test "list_videos/0 returns all videos" do
      video = video_fixture()
      assert Videos.list_videos() == [video]
    end

    test "get_video!/1 returns the video with given id" do
      video = video_fixture()
      assert Videos.get_video!(video.id) == video
    end

    test "create_video/1 with valid data creates a video" do
      assert {:ok, %Video{} = video} = Videos.create_video(@valid_attrs)
      assert video.title == "some title"
    end

    test "create_video/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Videos.create_video(@invalid_attrs)
    end

    test "update_video/2 with valid data updates the video" do
      video = video_fixture()
      assert {:ok, video} = Videos.update_video(video, @update_attrs)
      assert %Video{} = video
      assert video.title == "some updated title"
    end

    test "update_video/2 with invalid data returns error changeset" do
      video = video_fixture()
      assert {:error, %Ecto.Changeset{}} = Videos.update_video(video, @invalid_attrs)
      assert video == Videos.get_video!(video.id)
    end

    test "delete_video/1 deletes the video" do
      video = video_fixture()
      assert {:ok, %Video{}} = Videos.delete_video(video)
      assert_raise Ecto.NoResultsError, fn -> Videos.get_video!(video.id) end
    end

    test "change_video/1 returns a video changeset" do
      video = video_fixture()
      assert %Ecto.Changeset{} = Videos.change_video(video)
    end
  end

  describe "video_streams" do
    alias Api.Videos.VideoStream

    @valid_attrs %{url: "some url"}
    @update_attrs %{url: "some updated url"}
    @invalid_attrs %{url: nil}

    def video_stream_fixture(attrs \\ %{}) do
      {:ok, video_stream} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Videos.create_video_stream()

      video_stream
    end

    test "list_video_streams/0 returns all video_streams" do
      video_stream = video_stream_fixture()
      assert Videos.list_video_streams() == [video_stream]
    end

    test "get_video_stream!/1 returns the video_stream with given id" do
      video_stream = video_stream_fixture()
      assert Videos.get_video_stream!(video_stream.id) == video_stream
    end

    test "create_video_stream/1 with valid data creates a video_stream" do
      assert {:ok, %VideoStream{} = video_stream} = Videos.create_video_stream(@valid_attrs)
      assert video_stream.url == "some url"
    end

    test "create_video_stream/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Videos.create_video_stream(@invalid_attrs)
    end

    test "update_video_stream/2 with valid data updates the video_stream" do
      video_stream = video_stream_fixture()
      assert {:ok, video_stream} = Videos.update_video_stream(video_stream, @update_attrs)
      assert %VideoStream{} = video_stream
      assert video_stream.url == "some updated url"
    end

    test "update_video_stream/2 with invalid data returns error changeset" do
      video_stream = video_stream_fixture()
      assert {:error, %Ecto.Changeset{}} = Videos.update_video_stream(video_stream, @invalid_attrs)
      assert video_stream == Videos.get_video_stream!(video_stream.id)
    end

    test "delete_video_stream/1 deletes the video_stream" do
      video_stream = video_stream_fixture()
      assert {:ok, %VideoStream{}} = Videos.delete_video_stream(video_stream)
      assert_raise Ecto.NoResultsError, fn -> Videos.get_video_stream!(video_stream.id) end
    end

    test "change_video_stream/1 returns a video_stream changeset" do
      video_stream = video_stream_fixture()
      assert %Ecto.Changeset{} = Videos.change_video_stream(video_stream)
    end
  end
end
