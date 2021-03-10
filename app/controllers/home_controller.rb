class HomeController < ApplicationController
  def index
    # @books = Book.highest_rated
    @books = Book.highest_rated_sorted[0..5]
  end
end
