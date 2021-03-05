class BooksController < ApplicationController

    def index 
        if params[:search]
            @books = GoogleBooks.search("#{params[:search]}", {count: 3 })
        end
    end 

    # def show 
    #     @book = Book.find(params[:id])
    # end 

    def new 
    end

    def create 
        @search = Book.search(params[:search])
        @book = Book.new(book_params)
        @book.save
        redirect_to book_path(@book)
    end

    private 

    def book_params
        params.require(:book).permit(:title, :description, :average_rating, :author_id)
    end 

end
