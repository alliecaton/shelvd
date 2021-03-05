module BooksHelper

    def slug(title)
        title.downcase.split(" ").join("-")
    end


    def self.find_by_slug(slug)
        Book.all.find {|book| book.slug == slug}
    end       


end
