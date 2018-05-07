class UsersController < ApplicationController

	# def index
	#   @users = User.all
	#   if params[:follows]
	#     @users = @users.where(id: current_user.subscriptions_ids)
	#   end
	#   @users = @users.where("email ILIKE :str OR name ILIKE :str", str: "%#{params[:search]}%") if params[:search]
	#   @users = @users.order('created_at DESC')
	#   @users = @users.page_kaminari(params[:page])
	# end

	def index
		page = params[:page] || 1
		if params[:q].blank?
			@users = []
			@articles = []
		else
			@users = User.search(name_or_lastname_cont: params[:q]).result
			@articles = Article.search(header_or_body_cont: params[:q]).result
		end
	end

	def subscribe
		@user = User.find(params[:id])
		current_user.sub_unsub_user(@user)
		redirect_to users_path
	end

	def show_by_tag
    @articles = Article.tagged_with(params[:tag]).page_kaminari(params[:page])
    render 'index'
  end

end
