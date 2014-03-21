class HomeController < ApplicationController
  def index
    @videos = Video.order("id DESC").limit(1)
  end
end
