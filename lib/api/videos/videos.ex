defmodule Api.Videos do
  @moduledoc """
  The Videos context.
  """

  import Ecto.Query, warn: false
  alias Api.Repo

  alias Api.Videos.SourceVideo

  @doc """
  Returns the list of source_videos.

  ## Examples

      iex> list_source_videos()
      [%SourceVideo{}, ...]

  """
  def list_source_videos do
    Repo.all(SourceVideo)
  end

  @doc """
  Gets a single source_video.

  Raises `Ecto.NoResultsError` if the Source video does not exist.

  ## Examples

      iex> get_source_video!(123)
      %SourceVideo{}

      iex> get_source_video!(456)
      ** (Ecto.NoResultsError)

  """
  def get_source_video!(id), do: Repo.get!(SourceVideo, id)

  @doc """
  Creates a source_video.

  ## Examples

      iex> create_source_video(%{field: value})
      {:ok, %SourceVideo{}}

      iex> create_source_video(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_source_video(attrs \\ %{}) do
    %SourceVideo{}
    |> SourceVideo.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a source_video.

  ## Examples

      iex> update_source_video(source_video, %{field: new_value})
      {:ok, %SourceVideo{}}

      iex> update_source_video(source_video, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_source_video(%SourceVideo{} = source_video, attrs) do
    source_video
    |> SourceVideo.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a SourceVideo.

  ## Examples

      iex> delete_source_video(source_video)
      {:ok, %SourceVideo{}}

      iex> delete_source_video(source_video)
      {:error, %Ecto.Changeset{}}

  """
  def delete_source_video(%SourceVideo{} = source_video) do
    Repo.delete(source_video)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking source_video changes.

  ## Examples

      iex> change_source_video(source_video)
      %Ecto.Changeset{source: %SourceVideo{}}

  """
  def change_source_video(%SourceVideo{} = source_video) do
    SourceVideo.changeset(source_video, %{})
  end

  alias Api.Videos.VideoSegment

  @doc """
  Returns the list of video_segments.

  ## Examples

      iex> list_video_segments()
      [%VideoSegment{}, ...]

  """
  def list_video_segments do
    Repo.all(VideoSegment)
  end

  @doc """
  Gets a single video_segment.

  Raises `Ecto.NoResultsError` if the Video segment does not exist.

  ## Examples

      iex> get_video_segment!(123)
      %VideoSegment{}

      iex> get_video_segment!(456)
      ** (Ecto.NoResultsError)

  """
  def get_video_segment!(id), do: Repo.get!(VideoSegment, id)

  @doc """
  Creates a video_segment.

  ## Examples

      iex> create_video_segment(%{field: value})
      {:ok, %VideoSegment{}}

      iex> create_video_segment(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_video_segment(attrs \\ %{}) do
    %VideoSegment{}
    |> VideoSegment.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a video_segment.

  ## Examples

      iex> update_video_segment(video_segment, %{field: new_value})
      {:ok, %VideoSegment{}}

      iex> update_video_segment(video_segment, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_video_segment(%VideoSegment{} = video_segment, attrs) do
    video_segment
    |> VideoSegment.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a VideoSegment.

  ## Examples

      iex> delete_video_segment(video_segment)
      {:ok, %VideoSegment{}}

      iex> delete_video_segment(video_segment)
      {:error, %Ecto.Changeset{}}

  """
  def delete_video_segment(%VideoSegment{} = video_segment) do
    Repo.delete(video_segment)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking video_segment changes.

  ## Examples

      iex> change_video_segment(video_segment)
      %Ecto.Changeset{source: %VideoSegment{}}

  """
  def change_video_segment(%VideoSegment{} = video_segment) do
    VideoSegment.changeset(video_segment, %{})
  end

  alias Api.Videos.Video

  @doc """
  Returns the list of videos.

  ## Examples

      iex> list_videos()
      [%Video{}, ...]

  """
  def list_videos do
    Repo.all(Video)
  end

  @doc """
  Gets a single video.

  Raises `Ecto.NoResultsError` if the Video does not exist.

  ## Examples

      iex> get_video!(123)
      %Video{}

      iex> get_video!(456)
      ** (Ecto.NoResultsError)

  """
  def get_video!(id), do: Repo.get!(Video, id)

  @doc """
  Creates a video.

  ## Examples

      iex> create_video(%{field: value})
      {:ok, %Video{}}

      iex> create_video(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_video(attrs \\ %{}) do
    %Video{}
    |> Video.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a video.

  ## Examples

      iex> update_video(video, %{field: new_value})
      {:ok, %Video{}}

      iex> update_video(video, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_video(%Video{} = video, attrs) do
    video
    |> Video.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Video.

  ## Examples

      iex> delete_video(video)
      {:ok, %Video{}}

      iex> delete_video(video)
      {:error, %Ecto.Changeset{}}

  """
  def delete_video(%Video{} = video) do
    Repo.delete(video)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking video changes.

  ## Examples

      iex> change_video(video)
      %Ecto.Changeset{source: %Video{}}

  """
  def change_video(%Video{} = video) do
    Video.changeset(video, %{})
  end

  alias Api.Videos.VideoStream

  @doc """
  Returns the list of video_streams.

  ## Examples

      iex> list_video_streams()
      [%VideoStream{}, ...]

  """
  def list_video_streams do
    Repo.all(VideoStream)
  end

  @doc """
  Gets a single video_stream.

  Raises `Ecto.NoResultsError` if the Video stream does not exist.

  ## Examples

      iex> get_video_stream!(123)
      %VideoStream{}

      iex> get_video_stream!(456)
      ** (Ecto.NoResultsError)

  """
  def get_video_stream!(id), do: Repo.get!(VideoStream, id)

  @doc """
  Creates a video_stream.

  ## Examples

      iex> create_video_stream(%{field: value})
      {:ok, %VideoStream{}}

      iex> create_video_stream(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_video_stream(attrs \\ %{}) do
    %VideoStream{}
    |> VideoStream.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a video_stream.

  ## Examples

      iex> update_video_stream(video_stream, %{field: new_value})
      {:ok, %VideoStream{}}

      iex> update_video_stream(video_stream, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_video_stream(%VideoStream{} = video_stream, attrs) do
    video_stream
    |> VideoStream.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a VideoStream.

  ## Examples

      iex> delete_video_stream(video_stream)
      {:ok, %VideoStream{}}

      iex> delete_video_stream(video_stream)
      {:error, %Ecto.Changeset{}}

  """
  def delete_video_stream(%VideoStream{} = video_stream) do
    Repo.delete(video_stream)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking video_stream changes.

  ## Examples

      iex> change_video_stream(video_stream)
      %Ecto.Changeset{source: %VideoStream{}}

  """
  def change_video_stream(%VideoStream{} = video_stream) do
    VideoStream.changeset(video_stream, %{})
  end
end
