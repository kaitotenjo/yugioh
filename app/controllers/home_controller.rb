require 'uri'
require 'net/http'
class HomeController < ApplicationController
   before_action :load_user , only: :index

    def index
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
