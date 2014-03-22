class VideosController < ApplicationController
  before_filter :authenticate_user!

  def new
    @resource = Video.new
  end

  def create
    @resource = Video.new(video_params)

    if @resource.save
      redirect_to action: "show", id: @resource.hash_id
    else
      render :new
    end
 end

  def show
    @video = Video.find_by_hash_id(params[:id])
  end

  private

  def video_params
    params[:video].merge!({user_id: current_user.id})
    params.require(:video).permit(:youtube_url, :user_id)
  end

end
