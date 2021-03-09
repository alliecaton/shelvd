module AuthorsHelper


    def find_create(book)
        book.authors.split(", ").map do |author_name|
            Author.find_or_create_by(name: author_name)
        end
    end

    def find_author(authors_array)
        authors_array.map do |author|
            Author.find_by(name: author.name)
        end 
    end
    

end
