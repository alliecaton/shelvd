module BooksHelper

    def slug(title)
        title.downcase.split(" ").join("-")
    end


    def self.find_by_slug(slug)
        Book.all.find {|book| book.slug == slug}
    end    

    def check_shelves
        if user_signed_in? && current_user.shelves.length > 0
            render partial: "form", locals: {book: @book, display_book: @display_book, shelves: @shelves}
        elsif user_signed_in? && current_user.shelves.length <= 0
            link_to 'Create New Shelf', new_user_shelf_path(current_user)
        end
    end

end
