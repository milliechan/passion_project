get '/songs' do 
  @queue = Song.all
  erb :'songs/index'
end

# post a song to the queue 
post '/songs' do 
  p "*" * 1000
  p params
  p "*" * 1000
  @song = Song.new(params[:song]) #create new song
  if @song.save #saves new song or returns false if unsuccessful
    redirect '/songs' #redirect back to songs index page
  else
    redirect '/songs' # show new songs view again(potentially displaying errors)
  end

end
