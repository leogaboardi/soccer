class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :tournament
      t.string :label
      t.integer :round
      t.date :match_on
      t.time :match_at
      t.string :venue
      t.integer :home_team_id
      t.integer :away_team_id
      t.integer :home_goal
      t.integer :away_goal
      t.integer :outcome
      t.integer :user_id

      t.timestamps
    end
  end
end
