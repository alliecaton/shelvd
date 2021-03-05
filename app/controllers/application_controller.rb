class ApplicationController < ActionController::Base

    def unslug(title)
        title.split("-").join(" ")
    end
    
end
