class HomeController < ApplicationController
  def index
    @books = Book.highest_rated
  end
end
