class BooksController < ApplicationController
## add before action that requires login to create
## user_signed_in?

    def index 
        if params[:search]
            @books = Book.search("#{params[:search]}").uniq {|book| book.title }
        end
    end 

    def show 
        @shelves = current_user.shelves if user_signed_in?

        isbn = params[:id]

        if Book.find_by(isbn: params[:id])
            @display_book = Book.find_by(isbn: params[:id])
        else 
            @display_book = Book.search("isbn:#{isbn}").first  
        end
        @authors = @display_book.authors

        @book = Book.new
    end 

    def create 
        @new_book = Book.new(book_params)
        
        params[:book][:authors].split(",").map do |author_name|
            @new_book.authors << Author.find_or_create_by(name: author_name)
        end

        @shelf = Shelf.find_by(id: params[:book][:shelf_ids])
        if @shelf.books.find_by(title: @new_book.title)
            redirect_to book_path(@new_book.isbn), notice: "This book is already on this list!"
        else 
            @new_book.save
            redirect_to book_path(@new_book.isbn), notice: "Book added to #{@shelf.name} shelf"
        end
    end

    private 

    def book_params
        params.require(:book).permit(
            :title, 
            :description, 
            :average_rating, 
            :author_id, 
            :shelf_ids, 
            :isbn, 
            :image_link
         )
    end 

end
