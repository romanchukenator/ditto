class Game < ActiveRecord::Base
  belongs_to :player1, class_name: "User"
  belongs_to :player2, class_name: "User"

  def self.create_new_game_invite(player1, player2)
    game = new(player1: player1, player2: player2, status: "Invite")
  end
end


# class Game < ActiveRecord::Base
#   belongs_to :game, :class_name => "User", :foreign_key => "player1_id"
#   belongs_to :game, :class_name => "User", :foreign_key => "player2_id"
# end