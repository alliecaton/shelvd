class HomeController < ApplicationController
  def index
    if params[:search]
      @books = GoogleBooks.search("#{params[:search]}", {count: 1 })
    end
  end
end
