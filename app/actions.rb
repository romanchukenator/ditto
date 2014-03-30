helpers do
  def current_user
     @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end

get '/' do
  erb :index
end

get '/profile' do
  @games = Game.all
  erb :"profile"
end

# ====================
# Sign up
# ====================

get '/signup' do
  erb :'auth/signup'
end

post '/signup' do
  @user = User.new(
    email: params[:email],
    password: params[:password]
    )

    if @user.save
      redirect '/'
    else
      erb :'auth/signup'    
    end
end

# ====================
# Log in
# ====================

post '/' do
  @user = User.find_by(email: params[:email], password: params[:password])

  if User.verify_log_in?(params[:email], params[:password])
    if @user.password == params[:password]
      session[:user_id] = @user.id    
      redirect '/profile'
    end
  else
    @log_in_error = 1
    erb :'/index'
  end
end

# ====================
# Logout
# ====================

post '/logout' do
  session[:User_id] = nil
  redirect '/'
end

get '/logout' do
  session[:User_id] = nil
  redirect '/'
end

# ====================
# Game
# ====================

#Creates a new game with whomever you wish. Needs a validator for a valid email a1!
post '/create' do
  if params[:player2] != current_user.email
    if @player2 = User.find_by(email: params[:player2])
    @game = Game.create_new_game_invite(current_user, @player2)
    @game.save
    end
  else
    @games = Game.all
    @error = 1
    redirect :'/profile'
  end
  
  redirect '/game'
end

post '/game/:game_id/guess/:round_id' do

    @round = Round.find(params[:round_id])
    @game_id = params[:game_id]

    if Game.find(@game_id).player1?(current_user)
      puts params[:player1_word]
      puts @game_id

      @round.update(player1_word: params[:player1_word])
    end

    if !Game.find(@game_id).player1?(current_user)
      puts params[:player2_word]
      puts @game_id

      @round.update(player2_word: params[:player2_word])
    end

    if !Round.find(@round).word_match?
      if Round.find(@round).next_round?
        Round.create(game_id: @game_id)
      end
    end

  redirect "/game/#{@game_id}#the-good-stuff"
end

get '/game' do
  game = Game.where(player1_id: current_user.id).last
  redirect "/game/#{game.id}"
end

get '/game/:game_id' do
  @game = Game.find params[:game_id]
  erb :'game'
end

post '/game/:game_id/create-round' do
    @round = Round.create(
    game_id: params[:game_id],
    player1_word: params[:first_word]
    )
    Game.find(params[:game_id]).on_going
  redirect 'profile'
end