class CartController < ApplicationController
    before_action  :set_user
    
    def show
        if @user.nil?
            redirect_to root_path
        else
            @order_items = current_order.orderitems
        end
    end

    private
    
    def set_user
        @user = current_user
    end
end
