class Round < ActiveRecord::Base
  belongs_to :game

  # before_create :update_word
  # after_create :notify_opponent(current_player)

  def notify_opponent(current_player)
    puts "Should have an email sent out!"
  end

  def player1_turn?(current_player)
    player1_word
  end

  def self.round_exists?(game)
    find_by(game_id: game.id)
  end

  def next_round?
    player1_word && player2_word
  end

end