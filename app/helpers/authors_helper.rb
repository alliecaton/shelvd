module AuthorsHelper


    def find_create(book)
        book.authors.split(",").map do |author_name|
            author= Author.find_or_create_by(name: author_name)
        end.join(", ")
    end
    

end
