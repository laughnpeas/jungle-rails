class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :description
      t.integer :rating
      t.timestamps :createdat
      t.timestamps :updatedat
      t.references :product, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
    end
  end
end
