class CreateJoinTableGamesPlayers < ActiveRecord::Migration[6.1]
  def change
    create_join_table :games, :players do |t|
      t.index [:game_id, :player_id], unique: true
      t.index [:player_id, :game_id], unique: true
    end
  end
end
