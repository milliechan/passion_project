get '/songs' do 
  @queue = Song.all
  erb :'songs/index'
end

# post a song to the queue 
post '/songs' do 
  @song = Song.new(params[:song])
  if @song.save 
    if request.xhr? 
      erb :'/songs/_index', layout: false, locals: {song: @song}
    end 
  else
    redirect '/songs' 
  end
end


put '/songs/:id' do 
  @song = Song.find(params[:id]) 
  @song.assign_attributes(completed: true) 

  if @song.save 
    if request.xhr?
      @song.url.match(/[^=]*$/)[0]
    end
     
  else
   redirect '/songs'
  end
end

