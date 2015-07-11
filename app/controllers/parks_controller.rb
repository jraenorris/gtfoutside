class ParksController < ApplicationController

  def index
    # location = HTTParty.get('http://api.divesites.com')
    # @city = location["loc"]["city"]
    # @region = location["loc"]["region_name"]
    # binding.pry
    latitude = cookies["latitude"]
    longitude = cookies["longitude"]
    response = HTTParty.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{latitude},#{longitude}&radius=10000&types=park&campground=cruise&key=#{ENV["GOOGLE_KEY"]}")
    @env_key = ENV['GOOGLE_KEY']

    @places = response["results"]
    #
    # places.each do |data|
    #   session["#{data["name"]}"] = data["place_id"]
    # end
  end

  def show
    @place_info = HTTParty.get("https://maps.googleapis.com/maps/api/place/details/json?placeid=#{params[:id]}&key=#{ENV['GOOGLE_KEY']}")['result']
    @city = @place_info['address_components'][2]['long_name']
    @region = @place_info['address_components'][3]['long_name']
    @reviews = @place_info['reviews']

    # location = HTTParty.get('http://api.divesites.com')
    # @city = location["loc"]["city"]
    # @region = location["loc"]["region_name"]
    # @park = params[:park_name]
    # @place_info = HTTParty.get("https://maps.googleapis.com/maps/api/place/details/json?placeid=#{@place_id}&key=AIzaSyBRo-mtutP62p-Z5mPGwgZj0fArDw7e_7A")
    # @place_reviews = @place_info["result"]["reviews"]
  end

end
