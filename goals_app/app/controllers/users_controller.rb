class UsersController < ApplicationController
    before_action :require_logged_in!, only: [:show, :index]
    
    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to users_url
        else
            flash[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def show
        render :show
    end

    def index
        render :index
    end

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end
end