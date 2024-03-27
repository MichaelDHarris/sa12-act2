require 'httparty'
require 'json'

def worldtimezoneconverter(area, location)
  response = HTTParty.get("http://worldtimeapi.org/api/timezone/#{area}/#{location}")
  time_data = JSON.parse(response.body)
  time = Time.parse(time_data['datetime'])
  puts "The current time in #{area}/#{location} is #{time.strftime("%Y-%m-%d %H:%M:%S")}"
end
worldtimezoneconverter('Europe', 'London')
