class RegistrationsController < Devise::RegistrationsController

def create
	@user = User.new(sign_up_params)
	if @user.save
		flash[:success] = 'Welcome! You have signed up successfully.'
		redirect_to posts_path
	else
		flash[:error] = 'Can\'t sign in.'
		render 'new'
	end
end

private
	def sign_up_params
		params.require(:user).permit(:email, :user_name, :password, :password_confirmation)
	end

	def account_update_params
		params.require(:user).permit(:email, :user_name, :password, :password_confirmation,
							:current_password)
	end
end