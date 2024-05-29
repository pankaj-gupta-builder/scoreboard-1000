class AddWinnerToGame < ActiveRecord::Migration[6.1]
  def change
    add_reference :games, :winner, references: :players, null: true
  end
end
