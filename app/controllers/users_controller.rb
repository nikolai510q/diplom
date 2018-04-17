class UsersController < ApplicationController

  def index
    @users = User.all
    if params[:follows]
      @users = @users.where(id: current_user.subscriptions_ids)
    end
    @users = @users.where("email ILIKE :str OR name ILIKE :str", str: "%#{params[:search]}%") if params[:search]
    @users = @users.order('created_at DESC')
    @users = @users.page_kaminari(params[:page])
  end

  def subscribe
    @user = User.find(params[:id])
    current_user.sub_unsub_user(@user)
    redirect_to users_path
  end

end
