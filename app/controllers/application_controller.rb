class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
 
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :load_data
  helper_method :current_order
 
  protected
 
  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def load_data
    url= "https://db.ygoprodeck.com/api/v7/cardinfo.php"
    uri = URI(url)
    res = Net::HTTP.get_response(uri)
    @BEDs= JSON.parse(res.body)
  end

  def current_order
    if user_signed_in?
       if Order.find_by(status: "check").nil?
        Order.new(user_id: current_user.id )
       else
        Order.find_by(status: "check")
       end
    else
      flash[:danger] = "Please log in." 
      redirect_to root_path
    end
  end
  
end
