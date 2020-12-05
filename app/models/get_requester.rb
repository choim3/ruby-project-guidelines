require 'net/http'
require 'open-uri'
require 'json'


class GetRequester

  URL = "https://data.seattle.gov/resource/tazs-3rd5.json"

  # def initialize (url = "https://data.seattle.gov/resource/tazs-3rd5.json")
  #   @url = url
  # end

  def self.get_request
    uri = URI.parse(URL)
    response = Net::HTTP.get_response(uri)
    response.body
  end

  def self.parse_json #helper method???
    parse_result = JSON.parse(get_request)
  end

  def self.neighborhood_names
    result = parse_json
    result.find_all {|x| x["mcpp"]}.uniq
  end

end
