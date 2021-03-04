class HomeController < ApplicationController
  def index
    @top_ten = Book.search
  end
end
