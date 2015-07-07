class HomesController < ApplicationController

  def index
    location = HTTParty.get('http://api.divesites.com')
    @city = location["loc"]["city"]
    @region = location["loc"]["region_name"]
    response = HTTParty.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{location["loc"]["lat"]},#{location["loc"]["lng"]}&radius=10000&types=park&campground=cruise&key=AIzaSyBRo-mtutP62p-Z5mPGwgZj0fArDw7e_7A")
    @places = response["results"]
  end

end
