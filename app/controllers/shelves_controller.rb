class ShelvesController < ApplicationController
    
    def index
    end

    def show 
        @shelf = Shelf.find(params[:id])
    end

    def new
        @shelf = Shelf.new
    end 

    def create
        @shelf = Shelf.new(shelf_params)
        # @shelf.user = current_user
        @shelf.save 
        redirect_to shelf_path(@shelf)
    end

    private

    def list_params
        params.require(:shelf).permit(:name)
    end 

end
