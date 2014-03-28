class User < ActiveRecord::Base
  include BCrypt

  has_many :games

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end  
end

# class User < ActiveRecord::Base
#   has_many :player1_games, class_name: "Game", foreign_key: 'player1_id'
#   has_many :player2_games, class_name: "Game", foreign_key: 'player2_id'
# end