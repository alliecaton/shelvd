class BooksController < ApplicationController

    def index 
        if params[:search]
            @books = Book.search("#{params[:search]}")
        end
    end 

    def show 
        unslug = unslug(params[:id])
        @display_book = Book.search("#{unslug}").first
        @book = Book.new(title: @display_book.title, description: @display_book.description, average_rating: @display_book.average_rating)

    end 

    # def new 
    # end

    def create 
        @book = Book.new(book_params)
        @book.users << current_user
        @book.save
        redirect_to book_path(@book)
    end

    private 

    def book_params
        params.require(:book).permit(:title, :description, :average_rating, :author_id)
    end 

end
