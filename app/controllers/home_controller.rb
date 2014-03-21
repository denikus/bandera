class HomeController < ApplicationController
  def index
    @videos = Video.order("id DESC").limit(10)
  end
end
