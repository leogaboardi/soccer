class CreateHomeTeams < ActiveRecord::Migration
  def change
    create_table :home_teams do |t|
      t.integer :match_id
      t.integer :team_id

      t.timestamps
    end
  end
end
