class CartController < ApplicationController
    def show
        byebug
        @order_items = current_order.order_items
    end
end
