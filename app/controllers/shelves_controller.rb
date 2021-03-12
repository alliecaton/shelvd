class ShelvesController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :update, :destroy]

    def index
    end

    def show 
        @shelf = Shelf.find(params[:id])
    end

    def new
        user = User.find_by(id: params[:user_id])
        if user == current_user
            @shelf = Shelf.new(user_id: params[:user_id])
        else 
            redirect_to user_path(current_user)
        end
    end 

    def create
        @shelf = Shelf.new(shelf_params)
        if @shelf.valid?
            @shelf.user = current_user
            @shelf.save
            redirect_to user_path(current_user)
        else 
            render :new
        end 
    end

    def edit 
        @shelf = Shelf.find_by(id: params[:id])
        if @shelf.user != current_user
            redirect_to user_path(current_user)
        end
    end 

    def update 
        @shelf = Shelf.find_by(id: params[:id])
        if @shelf.user == current_user
            @shelf.update(shelf_params)
            @shelf.save
            redirect_to shelf_path(@shelf)
        else 
            redirect_to user_path(current_user)
        end 
    end 

    def destroy
        @shelf = Shelf.find_by(id: params[:id])
        user = User.find_by(id: params[:user_id])
        if user == current_user 
            @shelf.delete
            redirect_to user_path(user)
        else 
            redirect_to user_path(current_user)
        end
    end

    private

    def shelf_params
        params.require(:shelf).permit(:name, :user_id)
    end 

end
