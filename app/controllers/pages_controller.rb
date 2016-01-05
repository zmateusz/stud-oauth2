class PagesController < ApplicationController
  def index
    @id = get_id
    @secret = get_secret
  end

  def oauth
    uri = URI('https://github.com/login/oauth/access_token')
    res = Net::HTTP.post_form(uri, "client_id":get_id,"client_secret":get_secret,"code":params[:code])
    session[:access_token] = res.body
    render plain: res.body
  end

  private
  def get_id
    ENV['github_id']
  end

  def get_secret
    ENV['github_secret']
  end
end
