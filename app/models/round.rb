class Round < ActiveRecord::Base
  belongs_to :game

  validates :player1_word, presence: true
  validates :player1_word, length: { maximum: 50 }

  validates :player2_word, presence: true
  validates :player2_word, length: { maximum: 50 }

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

  def word_match?
    (player1_word == player2_word) && (player1_word != nil || player2_word != nil)
  end

  def self.round_count(game)
    where(game_id: game.id).count
  end

end