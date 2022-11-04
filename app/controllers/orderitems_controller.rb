class OrderitemsController < ApplicationController
    before_action  :order_params , only: :create
    def create
        byebug
        @orderitem = orderitem.new(order_params)
    end

    private 

    def order_params 
        params.permit( :quantity, :set_price, :set_name)
    end
end
