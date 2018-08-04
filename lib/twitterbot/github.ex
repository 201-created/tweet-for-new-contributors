defmodule Twitterbot.GitHub do
  use HTTPotion.Base

  def process_url(url) do
    "https://api.github.com/" <> url
  end

  def process_request_headers(headers) do
    Keyword.put headers, :"User-Agent", "tweet-for-new-contributors"
  end

  def process_response_body(body) do
    body |> Poison.decode!
  end
end
