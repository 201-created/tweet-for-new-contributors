defmodule Twitterbot.GitHubPoller do
  alias Twitterbot.{GitHub, Issue, Repo}

  use Task

  def start_link() do
    Task.start_link(&poll/0)
  end

  def poll() do
    receive do
    after
      10_000 ->
        get_issues()
        poll()
    end
  end

  defp get_issues() do
    fetch_json()
    |> save_issues()
  end

  defp fetch_json() do
    url = "repos" <>
      "/emberjs/ember.js" <>
      "/issues" <>
      "?state=open" <>
      "&labels=Good%20for%20New%20Contributors"

    GitHub.get(url).body
  end

  defp save_issues(issues) do
    Enum.each(issues,
      fn(issue) ->
        save_issue(issue)
      end
    )
  end

  defp save_issue(issue) do
    attrs = %{
      github_id: issue["id"],
      title: issue["title"],
      url: issue["html_url"]
    }

    case Repo.get_by(Issue, github_id: attrs[:github_id]) do
      nil -> %Issue{}
      issue -> issue
    end
    |> Issue.changeset(attrs)
    |> Repo.insert_or_update
  end
end
