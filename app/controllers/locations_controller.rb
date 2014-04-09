class LocationsController < ApplicationController

  def show
    Geocoder.configure(:language => I18n.locale)
    res = Geocoder.search("#{params[:latitude]},#{params[:longitude]}")
    city, country = res[0].data["GeoObject"]["description"].split(',')

    city.strip!
    country.strip!

    render json: {city: city, country: country}
  end

end
