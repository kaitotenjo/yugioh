class ProductController < ApplicationController
  before_action :get_product , only: [:index]

  def index
    @detail.each do |item|
      if item.has_value?(params[:card_id].to_i)
        @products = item
      else

      end
    end

    @card_sets=@products["card_sets"]
    @images = @products["card_images"]
  end

  private
  
  def get_product
    url= "https://db.ygoprodeck.com/api/v7/cardinfo.php?name=Dark%20Magician"
    uri = URI(url)
    res = Net::HTTP.get_response(uri)
    @BEDs= JSON.parse(res.body)
    @detail=@BEDs["data"]
  end

end
