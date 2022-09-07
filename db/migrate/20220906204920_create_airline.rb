class CreateAirline < ActiveRecord::Migration[6.1]
  def change
    create_table :airline do |t|
      t.integer :airline_id
      t.string :name
      t.string :slug
      t.string :image_url
      

      t.timestamps
    end
  end
end
