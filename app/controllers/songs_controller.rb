get '/songs' do 
  @queue = Song.all
  erb :'songs/index'
end

# post a song to the queue 
post '/songs' do 
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
    if request.xhr?
      p request
      request 
    end
     
  else
   redirect '/songs'
  end
end

# update database completed column
# in js, hide 'this' thing that was clicked 