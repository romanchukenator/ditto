# Homepage (Root path)

helpers do
   # Usable in ERB templates everywhere, and in any action below
  def current_user
     @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end

get '/' do
  erb :'index'
end

#Sign up
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
get '/login' do
  erb :'auth/login'
end

post '/login' do
  @user = User.find_by(email: params[:email], password: params[:password])

  if @user.password == params[:password]
    session[:user_id] = @user.id
    redirect '/'
  else
    erb :'auth/login'
  end
end

#Logout
post '/logout' do
  current_user = nil
  redirect '/'
end