class UsersController < ApplicationController    
    
    before_action :require_login, only: [:edit, :update, :delete]
    
    def new; end

    def create
        user = User.new(user_params)

        if user.save
            login(user)
            # redirect_to user show page
            render json: user
        else 
            flash.now[:errors] = user.errors.full_messages
            render :new
        end        
    end
    
    def edit
        @user = User.find_by(id: params[:id])
        render :edit
    end

    def update
        user = User.find_by(id: params[:id])

        if user && user.update(user_params)
            render json: user
        else
            flash.now[:errors] = user.errors.full_messages
            render :edit
        end
    end

    def delete
        user = User.find_by(user_params)

        if user
            user.delete
            redirect_to new_user_url
        else
            flash.now[:errors] = ["Cannot delete this user"]
            render json: user
        end
    end
    
    private

    def user_params
        params.require(:user).permit(:email, :username, :password)
    end
    
end