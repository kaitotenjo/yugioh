require 'uri'
require 'net/http'
class HomeController < ApplicationController
   before_action :load_user , only: :index

    def index
        url= "https://db.ygoprodeck.com/api/v7/cardinfo.php"
        uri = URI(url)
        res = Net::HTTP.get_response(uri)
        @BEDs= JSON.parse(res.body)
        @cards=Kaminari.paginate_array(@BEDs["data"]).page(params[:page]).per(12)
    end

    private

    def load_user
        if user_signed_in?
        @user = User.find_by(id: current_user.id)
        else 
            
        end
    end

end
