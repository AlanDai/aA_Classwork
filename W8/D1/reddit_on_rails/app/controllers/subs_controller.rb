class SubsController < ApplicationController
    before_action :ensure_moderator, only: [:edit, :update, :destroy]
    before_action :require_login, only: [:new, :create, :edit, :update, :destroy]

    def index
        @subs = Sub.all
        render :index
    end

    def new
        @sub = Sub.new
        render :new
    end

    def create
        @sub = Sub.new(sub_params)
       
        if @sub.save
            redirect_to sub_url(@sub)
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :new
        end
 
    end

    def show
        @sub = Sub.find_by(id: params[:id])
        if @sub
            render :show
        else
            flash[:errors] = ["Sub not found."]
        end
    end

    def edit
        @sub = Sub.find_by(sub_params)
        render :edit
    end

    def update
        sub = Sub.find_by(id: params[:id])
        if sub.update(sub_params)
            redirect_to sub_url(sub)
        else
            flash[:errors] = sub.errors.full_messages
            render :edit
        end
    end
    
    def destroy
        sub = Sub.find_by(id: params[:id])
        sub.destroy!
        redirect_to subs_url
    end

    private

    def ensure_moderator
        sub = Sub.find_by(id: params[:id])
        unless current_user.id == sub.moderator_id
            flash[:errors] = "Only moderators can update the sub."
            redirect_to sub_url(sub)
        end
    end
    
    def sub_params 
        params[:sub][:moderator_id] = current_user.id
        params.require(:sub).permit(:title, :description, :moderator_id)
    end

end
