# frozen_string_literal: true

# service for calling open weather api
class CurrentWeatherService
  BASE_URL = 'https://api.openweathermap.org/data/2.5/weather'

  def initialize(city_and_country_code:, units: 'imperial', appid: ENV['API_KEY'])
    @city_and_country_code = city_and_country_code
    @units = units
    @appid = appid
  end

  def call
    res = Net::HTTP.get_response(uri)
    JSON.parse(res.body)
  end

  private

  attr_reader :city_and_country_code, :units, :appid

  def uri
    return @uri if defined?(@uri)

    @uri = URI(BASE_URL)
    params = { q: city_and_country_code, units: units, appid: appid }
    @uri.query = URI.encode_www_form(params)
    @uri
  end
end
