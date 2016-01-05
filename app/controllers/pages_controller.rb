class PagesController < ApplicationController
  def index
    @id = ENV['github_id']
    @secret = ENV['github_secret']
  end
end
