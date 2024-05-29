class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :age
      t.jsonb :stats
      t.string :status

      t.timestamps
    end
  end
end
