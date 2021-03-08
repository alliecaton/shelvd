module ApplicationHelper
    
    def slug(title)
        title.downcase.split(" ").join("-")
    end

    def unslug(title)
        title.split("-").join(" ")
    end

    private 

    def create_author(book)
        params[:book][:authors].map do |author_name|
            Author.find_or_create(name: author_name)
        end
    end 
    

end
