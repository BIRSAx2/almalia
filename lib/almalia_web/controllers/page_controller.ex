defmodule AlmaliaWeb.PageController do
  use AlmaliaWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
