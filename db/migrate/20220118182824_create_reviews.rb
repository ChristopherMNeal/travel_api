class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :content
      t.string :author
      t.integer :rating
      t.string :landmark
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
