class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.boolean :status
      t.string :name

      t.timestamps
    end
  end
end
