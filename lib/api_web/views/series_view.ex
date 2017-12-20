defmodule ApiWeb.SeriesView do
  use ApiWeb, :view
  alias ApiWeb.SeriesView

  def render("index.json", %{series: series}) do
    %{data: render_many(series, SeriesView, "series.json")}
  end

  def render("show.json", %{series: series}) do
    %{data: render_one(series, SeriesView, "series.json")}
  end

  def render("series.json", %{series: series}) do
    %{id: series.id,
      name: series.name}
  end
end
