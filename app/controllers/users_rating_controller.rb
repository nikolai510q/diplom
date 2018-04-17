class UsersRatingsController < ApplicationController
  def update
    @users_rating = UsersRating.find_by(id: params[:id])
    if @users_rating
      @users_rating.update_attributes(users_rating_params)
    else
      @users_rating = UsersRating.create(users_rating_params)
    end
    @users_rating.user = current_user
    @users_rating.save
    redirect_to(:back)
  end

  private
    def users_rating_params
      params.permit(:article_id, :mark)
    end
end
