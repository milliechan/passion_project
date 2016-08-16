get '/sessions/new' do
  erb :'sessions/new'
end

# get '/sessions' do 
#   session[:id
# end

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


# log out of session 
delete '/sessions' do 
  session[:id] = nil 
  redirect '/'
end