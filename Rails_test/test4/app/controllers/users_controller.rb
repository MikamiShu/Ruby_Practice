class UsersController < ApplicationController

    def index 
        @search_params = user_search_params
        @users = User.search(@search_params)
    end

    def new 
        @user = User.new
    end
    
    def create 
        @input_params = user_params
        @user = User.new(@input_params)
        if @user.save 
            flash[:success] = '保存されました'
            redirect_to users_path
        else
            flash[:danger] = '保存に失敗しました'
            redirect_to new_user_path
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
