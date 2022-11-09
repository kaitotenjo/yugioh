class UsersController < ApplicationController
  before_action :set_user , only: [:index,:show]
  before_action :logged_in_user , except: [:new, :show, :create ]

  def index
    @uses= User.all.page(params[:page]).per(5)
  end

  def show
  end
  
  private

 

  def set_user
    @user=current_user
  end

  def logged_in_user
    unless user_signed_in?
      flash[:danger] = "Please log in."
      redirect_to root_path
    end
  end
end
