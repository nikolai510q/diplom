#
class OmniauthController < ApplicationController
	before_action :current_resources
	
	def create	
		if @user
			@account[user: @user]
		else
			@user = @account.create_user(vk_params)
		end
		@account.save
		session[:user_id] = sign_in(@user)
		redirect_to root_path	
	end
	
	private

	def current_resources
		@account = Account.find_or_create_by(uid: auth_hash[:uid], 
																				 provider: auth_hash[:provider], 
																				 email: auth_hash[:info][:email])

		@user = User.find_by(email: auth_hash[:info][:email])
	end

	def vk_params
		password = "#{rand(100)}_sample_password_#{rand(100)}"
		{
			name: auth_hash[:info][:name],
			email: auth_hash[:info][:email],
			password: password,
			password_confirmation: password
		}
	end

protected


	def auth_hash
		request.env['omniauth.auth']
	end
end