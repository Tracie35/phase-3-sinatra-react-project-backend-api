class CreateReview < ActiveRecord::Migration[6.1]
  def change
    create_table :review do |t|
      t.string :tittle
      t.string :description
      t.integer :score

      t.belongs_to :airline, foreign_key: true

      t.timestamps
    end
  end
end
