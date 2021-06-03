module ApplicationHelper

    def show_star(num)
        "⭐️"*(num.to_i)
    end

    def check_shelves
        if user_signed_in? && current_user.shelves.length > 0
            render partial: "form", locals: {book: @book, display_book: @display_book, shelves: @shelves}
        elsif user_signed_in? && current_user.shelves.length <= 0
            link_to 'Create New Shelf', new_user_shelf_path(current_user)
        end
    end

end
