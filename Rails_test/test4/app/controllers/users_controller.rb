class UsersController < ApplicationController

    def index 
        @search_params = user_search_params
        @users = User.search(@search_params)
    end

    def new 
        @user = User.new
    end
    
    def create 
        @user = User.new(user_params)
        if @user.save 
            redirect_to users_path
        else
            render :new
        end
    end

    def edit 
    end

    def destroy 
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_path
    end

    @private

    def user_params 
        params.require(:user).permit(:name, :email)
    end

    def user_search_params
        params.fetch(:search, {}).permit(:name, :email)
    end
    


    
end
