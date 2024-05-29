class ChangeStatusToStringInGame < ActiveRecord::Migration[6.1]
  def self.up
    change_table :games do |t|
      t.change :status, :string
    end
  end
  def self.down
    change_table :games do |t|
      t.change :status, :boolean, using: 'status::boolean'
    end
  end
end
