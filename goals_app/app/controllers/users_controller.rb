class UsersController < ApplicationController
    before_action :require_logged_in!, only: [:show, :index]
    
    def new

    end

    def create

    end

    def show
        render :show
    end

    def index
        render :index
    end
end