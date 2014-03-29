class Round < ActiveRecord::Base
  belongs_to :game

  # before_create :update_word
  # after_create :notify_opponent(current_player)

  def notify_opponent(current_player)
    puts "Should have an email sent out!"
  end

  def player2_word?(game)
    Round.find_by(game.id).player2_word
  end
  

  def update_word(current_player)
  end

  def add_word(current_player)
    if validate_player1?(current_player)
    end

    if validate_player2?(current_player)
    end
  end

  def validate_player1?(current_player)
  end

  def validate_player2?(current_player)
  end



  def self.round_exists?(game)
    find_by(game_id: game.id)
  end


end