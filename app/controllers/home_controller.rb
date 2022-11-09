require 'uri'
require 'net/http'
class HomeController < ApplicationController
   before_action :load_user , only: [:index,:show]
   before_action :get_product , only: [:show]

    def index
        @cards=Kaminari.paginate_array(@BEDs["data"]).page(params[:page]).per(12)
    end

    def show
    end

    private

    def get_product
        detail=@BEDs["data"]
        detail.each do |item|
          if item.has_value?(params[:card_id].to_i)
            
            @cds = item
          else
    
          end
        end
        @cards=@cds
        @card_sets=@cds["card_sets"]
        @images = @cds["card_images"]
    end

    def load_user
       @user = current_user
    end

end
