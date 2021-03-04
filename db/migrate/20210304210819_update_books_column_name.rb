class UpdateBooksColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :books, :ave_rating, :average_rating
    rename_column :books, :rating_count, :ratings_count
  end
end
