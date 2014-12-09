class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :label
      t.string :address
      t.string :url_picture

      t.timestamps
    end
  end
end
