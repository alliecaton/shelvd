class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :author_id
      t.text :description
      t.integer :ave_rating
      t.integer :rating_count

      t.timestamps
    end
  end
end
