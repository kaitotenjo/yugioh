class ProductsController < ApplicationController
  before_action :get_product , only: [:index,:show]
  before_action :load_user, only: [:index, :show ]

  def index
  end

  def show
    @card_sets.each do |card_set|
      if card_set.has_value?(params[:id].to_s)
        @card_detail=card_set
      else
      end
    end
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
    if user_signed_in?
    @user = User.find_by(id: current_user.id)
    else 
        
    end
  end

end
