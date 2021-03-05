class BooksController < ApplicationController


    def index 
        if params[:search]
            @books = Book.search("#{params[:search]}").uniq {|book| book.title }
        end
    end 

    def show 
        isbn = params[:id]
        @display_book = Book.search("isbn:#{isbn}").first
        @book = Book.new(title: @display_book.title, description: @display_book.description, average_rating: @display_book.average_rating)
    end 

    # def new 
    # end

    def create 
        @book = Book.new(book_params)
        @book.save
        redirect_to book_path(@book)
    end

    private 

    def book_params
        params.require(:book).permit(:title, :description, :average_rating, :author_id)
    end 

end
