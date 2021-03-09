class ReadingRoomsController < ApplicationController

    def show 
        @room = ReadingRoom.find(params[:id])
    end

    def new 
        if params[:user_id] && user_signed_in? && user != current_user
            redirect_to user_path(user), alert: "User not found"
        else
            @readingroom = ReadingRoom.new
            @post = Post.new
        end
    end 


    def create 
        @readingroom = ReadingRoom.new(room_params)
        if @readingroom.valid? 
            @readingroom.users << current_user
            @readingroom.save 
            redirect_to reading_room_path(@readingroom)
        else
            render :new
        end 
    end 


    private 

    def room_params 
        params.require(:reading_room).permit(:name, :description)
    end 


end
