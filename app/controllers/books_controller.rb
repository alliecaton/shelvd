class BooksController < ApplicationController

    def index 
        # @books = GoogleBooks.search("#{params[:search]}", {count: 3 })
    end 

    def show 
        ## want to be able to show a book without saving it to the DB. only wanna save a book to the db if it gets saved to a list
    end 

    def new 
    end

    def create 
        @search = Book.search(params[:search])
        @book = Book.new(book_params)

        redirect_to 
    end

    private 

    def book_params
        params.require(:book).permit(:title, :description, :rating, :author_id)
    end 

end
