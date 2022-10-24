require 'uri'
require 'net/http'
class HomeController < ApplicationController
    def index
        url= "https://db.ygoprodeck.com/api/v7/cardinfo.php?name=Dark%20Magician"
        uri = URI(url)
        res = Net::HTTP.get_response(uri)
        @Dark= JSON.parse(res.body)
    end
end
