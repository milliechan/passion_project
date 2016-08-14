get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do 
  @user = User.find_by(email: params[:email])
  if @user && @user.authenticate(params[:password])
    session[:id] = @user.id 
    redirect "/songs"
  else 
    @errors = "Invalid login information. Please try again"
    erb :'sessions/new'
  end
end