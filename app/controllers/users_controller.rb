class UsersController < ApplicationController
	def index
		page = params[:page] || 1
		if params[:q].blank?
			@users = []
			@articles = []
		else
			@users = User.search(name_or_lastname_cont: params[:q]).result
			@articles = Article.approved.search(header_or_body_cont: params[:q]).result
		end
	end

	def subscribe
		@user = User.find(params[:id])
		current_user.follow(@user)
	end

	def unsubscribe
		@user = User.find(params[:id])
		current_user.stop_following(@user)
	end

	def show_by_tag
    @articles = Article.approved.tagged_with(params[:tag]).page_kaminari(params[:page])
    render 'index'
  end

end
