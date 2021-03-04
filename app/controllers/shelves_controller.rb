class ShelvesController < ApplicationController
    
    def index
    end

    def show 
        @shelf = Shelf.find(params[:id])
    end

    def new
        user = User.find_by(id: params[:user_id])
        if params[:user_id]
            redirect_to user_path(user)
        else
            @shelf = Shelf.new(user_id: params[:user_id])
        end
    end 

    def create
        @shelf = Shelf.new(shelf_params)
        @shelf.user = current_user
        @shelf.save 
        redirect_to shelf_path(@shelf)
    end

    private

    def shelf_params
        params.require(:shelf).permit(:name, :user_id)
    end 

end
