class FixPlayerIdsInGame < ActiveRecord::Migration
  def change
    rename_column :games, :player1, :player1_id
    rename_column :games, :player2, :player2_id
  end
end
