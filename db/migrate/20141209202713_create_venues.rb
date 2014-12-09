class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :label
      t.string :address
      t.string :picture_url
      t.integer :capacity

      t.timestamps
    end
  end
end
