class PostsController < ApplicationController

    def new
        if user = User.find_by(id: params[:user_id])
            params[:user_id] && user_signed_in? && user != current_user
            redirect_to user_path(user), alert: "User not found"
        else 
            @post = Post.new(user_id: current_user.id, reading_room_id: params[:reading_room_id])
        end
    end

    def create 
        @post = Post.new(post_params)
        room = ReadingRoom.find_by(id: params[:post][:reading_room_id])
        if @post.valid?
            @post.save 
            redirect_to reading_room_path(room)
        else 
            redirect_to reading_room_path(room), alert: "Post could not be saved"
        end
    end

    def edit
    end 

    def update
    end 

    def destroy 
    end 

    private 

    def post_params 
        params.require(:post).permit(:content, :reading_room_id)
    end 
end
