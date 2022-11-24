class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :load_data
  helper_method :current_order
  helper_method :set_user
 
  protected
 
  def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up) do |user_params|
    user_params.permit(:email,:password,:password_confirmation ,:role)
   end
  end

  def load_data
    url= "https://db.ygoprodeck.com/api/v7/cardinfo.php"
    uri = URI(url)
    res = Net::HTTP.get_response(uri)
    @BEDs= JSON.parse(res.body)
  end

  def current_order
    if user_signed_in?
      @order=Order.find_by(status: "check")
       if @order.nil? || @order.user_id != current_user.id
        Order.new(user_id: current_user.id )
       else
        return @order
       end
    else
      flash[:danger] = "Please log in." 
      redirect_to root_path
    end  
  end

  def set_user
    @user= current_user
  end
  
  
end
