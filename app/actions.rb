require 'bcrypt'

helpers do
  def current_user
     @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end

get '/' do
  erb :'index'
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
      current_user
      redirect '/'
    else
      erb :'auth/signup'    
    end
end




# ====================
# Log in
# ====================

post '/' do
  @user = User.find_by(email: params[:email])

  if @user.password == params[:password]
    session[:user_id] = @user.id
    redirect '/profile'
  else
    erb :'/'
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

post '/game' do

  if @player2 = User.find_by(email: params[:player2])
    
    puts current_user.email
    @game = Game.create_new_game_invite(current_user, @player2)
  
    @game.save
  end

  # if @game.save
  #   redirect '/profile'
  # else
  #   erb :'/profile'
  # end

  redirect '/game'
end


get '/game' do
  erb :'game'
end
