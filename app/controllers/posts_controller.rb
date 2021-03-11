class PostsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]


    def new
        if user = User.find_by(id: params[:user_id])
            params[:user_id] && user_signed_in? && user != current_user
            redirect_to user_path(user), alert: "User not found"
        else 
            @post = Post.new
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
        room = ReadingRoom.find(params[:reading_room_id])
        if current_user.id == params[:user_id].to_i
            @post = Post.find(params[:id])
        else 
            redirect_to reading_room_path(room), alert: "You are not the owner of this post"
        end
    end 

    def update
        if current_user.id == params[:post][:user_id].to_i
            room = ReadingRoom.find_by(id: params[:post][:reading_room_id])
            post = Post.find_by(id: params[:id])
            post.update(post_params)
            post.save
            redirect_to reading_room_path(room)
        else 
            redirect_to reading_room_path(room), alert: "You are not the owner of this post"
        end
    end 

    def destroy 
        room = ReadingRoom.find_by(id: params[:reading_room_id])
        post = Post.find(params[:id])
        if post.user == current_user
            post.destroy
            redirect_to reading_room_path(room)
        else 
            redirect_to reading_room_path(room), alert: "You are not the owner of this post"
        end
    end 

    private 

    def post_params 
        params.require(:post).permit(:content, :reading_room_id, :user_id)
    end 
end
