defmodule TwitterbotWeb.PageController do
  use TwitterbotWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
