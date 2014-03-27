class AddGame < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :player1
      t.integer :player2
      t.string :status

      t.timestamps
    end
  end
end
