get '/' do 
  if current_user 
    redirect '/songs'
  else
    erb :'index'
  end
end

get '/users/new' do
  if request.xhr? 
    erb :'users/_new', layout: false
  else 
    erb :'users/new'
  end
end

# create a new user 
post '/users/new' do 
  @user = User.new(params[:user])

  if @user.save 
    session[:id] = @user.id 
    redirect "/songs"
  else 
    erb :'users/new'
  end
end