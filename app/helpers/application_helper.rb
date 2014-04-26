module ApplicationHelper
  def video_city(video)
    return (video.city.blank? ? video.user.city : video.city)
  end

  def video_country(video)
    return (video.country.blank? ? video.user.country : country.city)
  end
end
