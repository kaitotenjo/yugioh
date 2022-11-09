class CartController < ApplicationController
    before_action  :set_user
    
    def show
        @order_items = current_order.orderitems
    end
    private

    def set_user
        @user = current_user
    end
end
