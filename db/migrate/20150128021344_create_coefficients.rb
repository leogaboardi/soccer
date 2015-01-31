class CreateCoefficients < ActiveRecord::Migration
  def change
    create_table :coefficients do |t|
      t.integer :user_id
      t.decimal :value
      t.text :scope
      t.text :name

      t.timestamps
    end
  end
end
