get '/google817252d9e6d04b1e.html' do
  google-site-verification: google817252d9e6d04b1e.html
end

get '/search' do 
  p  "*" * 80 
  p "search query: #{params[:query]}"

  query = params[:query]
  path = "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=10"
  path += "&fields=items"
  path += "&key=#{ENV['YOUTUBE_KEY']}"

  # GET https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=10&q=beyonce+karaoke&fields=items&key={YOUR_API_KEY}

  response = HTTParty.get(path)
  p response.to_json 
  # p response
  # GET https://www.googleapis.com/youtube/v3/search?q=radiohead&key={YOUR_API_KEY}
  # GET https://www.googleapis.com/youtube/v3/search


  # youtube_link = "https://www.youtube.com/watch?v=" + videoId]

  # items = response.items
  # videoId = items[1].id.videoId 

  # video_title = items[1].snippet.title
  # thumbnail = items[1].snippet.thumbnails.default.url

"https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=10&fields=items&key=#{ENV['YOUTUBE_KEY']}"
end

post '/search' do 
  #post a video to list (params[:search_result])
end

