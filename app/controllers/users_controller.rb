class UsersController < ApplicationController
  before_action :load_user, except: [:index, :new, :create ]
  before_action :logged_in_user, except: [:new, :show, :create ]

  def index
  end

  def new
    @user= User.new
  end

  def show
  end

  def create
    byebug
      @user = User.new user_params
      if @user.save
          flash[:success] = "Register success"
          redirect_to users_path
      else
          flash[:success] = "Register failed"
          render :new
      end
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
    render "edit"
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = "User deleted"
      redirect_to users_path
    else
      flash[:error] = " delete fails"
      redirect_to users_url
    end
  end
  
  private

  def user_params
      params.require(:user).permit :email, :password
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:warming] = "user not found"
    redirect_to root_path
  end
end
