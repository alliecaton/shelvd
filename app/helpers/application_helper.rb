module ApplicationHelper
    
    def slug(title)
        title.downcase.split(" ").join("-")
    end

    def unslug(title)
        title.split("-").join(" ")
    end
    

end
