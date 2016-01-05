class PagesController < ApplicationController
  def index
    @id = get_id
    @secret = get_secret
  end

  def oauth
    uri = URI('https://github.com/login/oauth/access_token')
    res = Net::HTTP.post_form(uri, "client_id":get_id,"client_secret":get_secret,"code":params[:code])
    session[:access_token] = res.body
    redirect_to pages_user_path
  end

  def logout
    session[:access_token] = nil
    redirect_to root_path
  end

  def user
    uri = URI("https://api.github.com/user")
    res = Net::HTTP.post_form(uri, "access_token":session[:access_token])
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
