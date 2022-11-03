class ProductsController < ApplicationController
  before_action :get_product , only: [:index,:show,:product_detail]
  before_action :load_user, only: [:index, :show,:product_detail ]

  def index
  end

  def show
  end
  
  def product_detail
    @card_sets.each do |card_set|
      # byebug
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
