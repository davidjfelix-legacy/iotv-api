defmodule ApiWeb.PerformanceView do
  use ApiWeb, :view
  alias ApiWeb.PerformanceView

  def render("index.json", %{performances: performances}) do
    %{data: render_many(performances, PerformanceView, "performance.json")}
  end

  def render("show.json", %{performance: performance}) do
    %{data: render_one(performance, PerformanceView, "performance.json")}
  end

  def render("performance.json", %{performance: performance}) do
    %{id: performance.id,
      name: performance.name}
  end
end
