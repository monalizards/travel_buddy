OpenWeatherAPI.configure do |config|
  # API key
  config.api_key = ENV['WEATHER_API_KEY']

  config.default_units = 'metric'
end
