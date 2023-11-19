# frozen_string_literal: true

# home controller
class HomeController < ApplicationController
  def index
    data = CurrentWeatherService.new(city_and_country_code: 'Tampa,us').call
    @weather = Weather.new(data)
  end
end
