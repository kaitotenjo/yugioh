class CartController < ApplicationController
    before_action  :set_user
    before_action :get_order_items ,only:[ :show, :update_quantity]
    
    def show 
    end

    def update_status
        @order=Order.find_by_id(params[:order_id])
        if @order.update_attribute(:status ,"checking")
            UserMailer.with(user: current_user ,order: @order).ordersuccess.deliver_now
        else
            flash[:danger] = "order fail"
        end
        @payment= Payment.new(order_id: @order.id,payer_id: @user.id)
        @payment.save
        redirect_to root_path
    end 

    def update_quantity
        @order_items.each do |order_item|
          if params[order_item.card_name] == "0"
            order_item.delete
          else
            order_item.update_attribute(:quantity,params[order_item.card_name])
          end
        end
        respond_to do |format|
            format.html { redirect_to cart_path } #, flash[:success] = "holder updated")
            format.js
        end
    end

    private

    def get_order_items 
        if @user.nil?
            redirect_to root_path
        else
            @order_items = current_order.orderitems
        end
    end

end
