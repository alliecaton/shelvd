class BooksController < ApplicationController


    def index 
        if params[:search]
            @books = Book.search("#{params[:search]}").uniq {|book| book.title }
        end
    end 

    def show 
        @shelves = current_user.shelves
        isbn = params[:id]

        if Book.find_by(isbn: params[:id])
            @display_book = Book.find_by(isbn: params[:id])
        else 
            @display_book = Book.search("isbn:#{isbn}").first
        end

        @book = Book.new(title: @display_book.title, description: @display_book.description, average_rating: @display_book.average_rating)
    end 

    def new 
        @book = Book.new
    end

    def create 
        @book = Book.new(book_params)
        @shelf = Shelf.find_by(id: params[:book][:shelf_ids])
        @book.shelves << @shelf
        @book.save
        redirect_to book_path(@book.isbn), notice: "Book added to #{@shelf.name} shelf"
    end

    private 

    def book_params
        params.require(:book).permit(:title, 
            :description, 
            :average_rating, 
            :author_id, 
            :shelf_ids, 
            :isbn, 
            :image_link
         )
    end 

end
