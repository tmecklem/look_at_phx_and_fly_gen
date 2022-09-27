defmodule LookatgenWeb.PageController do
  use LookatgenWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
