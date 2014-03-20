class VideosController < ApplicationController
  before_filter :authenticate_user!

  def new
    @resource = Video.new
  end

  def create
    #ap params[:video].merge({user_id: current_user.id})   ap video_params
    @resource = Video.new(video_params)

    if @resource.save
      redirect_to action: "show", id: @resource.id
    else
      ap @resource.errors.messages
      render :new
    end
 end

  def show

  end

  private


  def video_params
    params[:video].merge!({user_id: current_user.id})
    params.require(:video).permit(:url, :user_id)
  end

end
