class Game < ActiveRecord::Base
  belongs_to :player1, class_name: "User"
  belongs_to :player2, class_name: "User"

  def self.create_new_game_invite(player1, player2)
    @game = new(player1: player1, player2: player2, status: "Invite")
  end

  def player1?(current_user)
    current_user.id == player1_id
  end

  def self.user_games(current_user)
    where("player1_id = ? or player2_id = ?", current_user.id, current_user.id).where(status: "Invite")
  end
end


