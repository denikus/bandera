class LocationsController < ApplicationController

  def show
    Geocoder.configure(:language => I18n.locale)
    res = Geocoder.search("#{params[:latitude]},#{params[:longitude]}")

    res_json = res.first.data.as_json

    city = res_json["address_components"][3]["long_name"]
    country = res_json["address_components"].last["long_name"]

    render json: {city: city, country: country}
  end

end
