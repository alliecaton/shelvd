class ReadingRoomsController < ApplicationController

    def index 
        if params[:search]
            @readingrooms = ReadingRoom.search(params[:search])
        else 
            @readingrooms = ReadingRoom.all
        end
    end 

    def show 
        @room = ReadingRoom.find(params[:id])
        # if user = User.find_by(id: params[:user_id])
        #     params[:user_id] && user_signed_in? && user != current_user
        #     redirect_to user_path(user), alert: "User not found"
        # else 
            @post = Post.new
        # end
    end

    def new 
        if params[:user_id] && user_signed_in? && user != current_user
            redirect_to user_path(user), alert: "User not found"
        else
            @readingroom = ReadingRoom.new
        end
    end 

    def create 
        @readingroom = ReadingRoom.new(room_params)
        if @readingroom.valid? 
            @readingroom.users
            @readingroom.save 
            redirect_to reading_room_path(@readingroom)
        else
            :new
        end 
    end 


    private 

    def room_params 
        params.require(:reading_room).permit(:name, :description)
    end 


end
