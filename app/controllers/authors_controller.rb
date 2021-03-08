class AuthorsController < ApplicationController

    def show 
        @author = Author.find_by(id: params[:id])
        @books = GoogleBooks.search("inauthor:#{@author.name}")
    end 

end
