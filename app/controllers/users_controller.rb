class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:show]
	before_action :redirect_to_root, if: :not_current_user?, only: [:show]
	

	def index
   		@users = User.all
   	end

	def show

	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to users_path
		end
	end


	def edit
	end

	def update
		if @user.update(user_params)
			redirect_to @user
		else
		render :edit	
		end
	end

	def destroy
		if @user.destroy
			redirect_to users_url
		end
	end

	
	private

	def not_current_user?
      return params[:id].to_i != current_user.id
    end

	def set_user
      @user = User.find(params[:id])
    end

	def user_params
      params.require(:user).permit(:email, :encrypted_password, :description, :first_name, :last_name)
    end

    def redirect_to_root
      puts "$"*1000
      redirect_to events_path
    end
end
