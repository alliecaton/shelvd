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
        @post = Post.find(params[:id])
    end 

    def update
        room = ReadingRoom.find_by(id: params[:post][:reading_room_id])
        post = Post.find_by(id: params[:id])
        post.update(post_params)
        post.save
        redirect_to reading_room_path(room)
    end 

    def destroy 
        room = ReadingRoom.find_by(id: params[:reading_room_id])
        Post.find(params[:id]).destroy
        redirect_to reading_room_path(room)
    end 

    private 

    def post_params 
        params.require(:post).permit(:content, :reading_room_id, :user_id)
    end 
end
