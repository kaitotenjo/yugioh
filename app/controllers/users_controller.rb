class UsersController < ApplicationController
  before_action :load_user, except: [:index, :new, :create ]
  before_action :logged_in_user , except: [:new, :show, :create ]

  def index
    @uses= User.all.page(params[:page]).per(5)
  end

  def show
  end
  
  private

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:warming] = "user not found"
    redirect_to root_path
  end

  def logged_in_user
    unless user_signed_in?
      flash[:danger] = "Please log in."
      redirect_to root_path
    end
  end
end
