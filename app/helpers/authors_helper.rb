module AuthorsHelper

    def authors_display
        if @display_book.authors.length > 0
            @display_book.authors.map do |author|
                author.name
            end.join(", ")
        else 
            @authors
        end 
    end


end
