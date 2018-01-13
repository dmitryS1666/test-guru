module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(username, repo)
    link_to "https://github.com/#{username}/#{repo}", target: "_blank" do
      yield
    end
  end

  def flash_alert
    if flash[:alert]
      content_tag :p, flash[:alert], class: 'flash alert'
    end
  end
end
