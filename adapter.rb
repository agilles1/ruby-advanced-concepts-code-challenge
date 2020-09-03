require 'open-uri'
require 'nokogiri'
require 'json'
require 'net/http'
require 'openssl'

class API

    def fetch_json_data
    url = URI("https://realtor.p.rapidapi.com/properties/v2/list-for-sale?sort=relevance&city=New%20York%20City&limit=5&offset=0&state_code=NY")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-host"] = 'realtor.p.rapidapi.com'
    request["x-rapidapi-key"] = ''

    response = http.request(request)

    JSON.parse(response.read_body) 
    end

    def listings
    fetch_json_data["properties"]
    end
    

    def create_listings
        listings.each_with_index do |property, i| 
            binding.pry
            Listing.new(property["address"]["city"], property["price"])
        end
    end


end

# class Scraper

#     HTML_URL = ""

#     def scrape_html_data
#         html = open(URL)
#         doc = Nokogiri::HTML(html)
#         # use Nokogiri's #css method to return data
#         # instantiate Listings
#     end
# end