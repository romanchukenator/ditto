class AddRound < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :game_id
      t.string :player1_word
      t.string :player2_word

      t.timestamps
    end
  end
end
