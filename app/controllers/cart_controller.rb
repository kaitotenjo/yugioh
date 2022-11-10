class CartController < ApplicationController
    before_action  :set_user
    
    def show
        if @user.nil?
            redirect_to root_path
        else
            @order_items = current_order.orderitems
        end
    end

    def update_status
        @order=Order.find_by_id(params[:order_id])
        @order.update_attribute(:status ,"checking")
        @payment= Payment.new(order_id: @order.id,payer_id: @user.id)
        @payment.save
        redirect_to root_path
    end

    private
    
    def set_user
        @user = current_user
    end
end
