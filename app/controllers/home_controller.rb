class HomeController < ApplicationController
  def index
    @books = Book.highest_rated_sorted[0..7].uniq
  end
end
