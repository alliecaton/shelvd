class ShelvesController < ApplicationController
    ## add before action that requires login
    
    def index
    end

    def show 
        @shelf = Shelf.find(params[:id])
    end

    def new
        user = User.find_by(id: params[:user_id])
        if params[:user_id] && user_signed_in? && user != current_user
            redirect_to user_path(user), alert: "User not found"
        else
            @shelf = Shelf.new(user_id: params[:user_id])
        end
    end 

    def create
        @shelf = Shelf.new(shelf_params)
        if @shelf.valid?
            @shelf.user = current_user
            @shelf.save
            redirect_to shelf_path(@shelf)
        else 
            render :new
        end 
    end

    private

    def shelf_params
        params.require(:shelf).permit(:name, :user_id)
    end 

end
