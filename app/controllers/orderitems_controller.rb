class OrderitemsController < ApplicationController
    before_action  :set_order , only: [:create]
    before_action  :set_user

    def create
      @orderitem = @order.orderitems.new(order_params)
      if @order.orderitems.find_by(set_code: @orderitem.set_code).nil? 
        @order.save
        redirect_back(fallback_location: root_path)
      else 
        old_quantity = @orderitem.quantity
        @orderitem = @order.orderitems.find_by(set_code: @orderitem.set_code)
        new_quantity = @orderitem.quantity + old_quantity
        @orderitem.update_attribute(:quantity,new_quantity)
        redirect_back(fallback_location: root_path)
      end
    end

    def update
      @orderitem = @order.order_items.find_by_id(params[:id])
      @orderitem.update_attributes(order_params)
      @orderitems = current_order.order_items
    end 

    def destroy
      byebug
      @orderitem = @order.order_items.find_by_id(params[:id])
      @orderitem.destroy
      @orderitems = current_order.order_items
    end

    private 

    def order_params 
      params.permit( :quantity, :set_price, :set_name, :card_name, :card_image, :set_code)
    end

    def set_order
      @order = current_order
    end
end

