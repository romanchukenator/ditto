require 'bcrypt'

helpers do
  def current_user
     @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end

get '/' do
  erb :'index'
end

# Sign up
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

#Login
get '/' do
  erb :'auth/login'
end

post '/' do
  @user = User.find_by(email: params[:email])

  if @user.password == params[:password]
    session[:user_id] = @user.id
    redirect '/'
  else
    erb :'auth/login'
  end
end

#Logout
post '/logout' do
  session[:user_id] = nil
  redirect '/'
end