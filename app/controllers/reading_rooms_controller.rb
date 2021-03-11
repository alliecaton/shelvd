class ReadingRoomsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]

    def index 
        if params[:search]
            @readingrooms = ReadingRoom.search(params[:search])
        else 
            @readingrooms = ReadingRoom.all
        end
    end 

    def show 
        @room = ReadingRoom.find(params[:id])
        @post = Post.new
    end

    def new 
        @readingroom = ReadingRoom.new
    
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
