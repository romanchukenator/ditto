class Game < ActiveRecord::Base
  belongs_to :player1, class_name: "User"
  belongs_to :player2, class_name: "User"





  def logged_in_player(current_user)
    if current_user == player1_id
      User.find(current_user).email
    elsif current_user == player2_id      
      User.find(current_user).email
    end
  end



  def other_player(current_user)
    if current_user != player1_id
      User.find(player1_id).email
    elsif current_user != player2_id      
      User.find(player2_id).email
    end  
  end


  def self.create_new_game_invite(player1, player2)
    game = new(player1: player1, player2: player2, status: "Invite")
  end

end

  

# class Game < ActiveRecord::Base
#   belongs_to :game, :class_name => "User", :foreign_key => "player1_id"
#   belongs_to :game, :class_name => "User", :foreign_key => "player2_id"
# end