get '/songs' do 
  @queue = Song.all
  erb :'songs/index'
end

# post a song to the queue 
post '/songs' do 
  p "*" * 1000
  p params
  p "*" * 1000
  @song = Song.new(params[:song])
  if @song.save 
    redirect '/songs' 
  else
    redirect '/songs' 
  end
end


put '/songs/:id' do 
  @song = Song.find(params[:id]) 
  @song.assign_attributes(completed: true) 

  if @song.save 
    redirect '/songs' 
  else
    erb :'songs/edit' 
  end
end

