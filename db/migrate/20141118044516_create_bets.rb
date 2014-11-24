class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.integer :match_id
      t.integer :user_id
      t.integer :guess

      t.timestamps
    end
  end
end
