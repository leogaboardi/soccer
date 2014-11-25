class CreateAwayTeams < ActiveRecord::Migration
  def change
    create_table :away_teams do |t|
      t.integer :match_id
      t.integer :team_id

      t.timestamps
    end
  end
end
