get '/google817252d9e6d04b1e.html' do
  "google-site-verification: google817252d9e6d04b1e.html"
end

get '/search' do 
  p  "*" * 80 
  p "search query: #{params[:query]}"

  query = params[:query]
  path = "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=10&"
  path += "q=#{query}"
  path += "&fields=items"
  path += "&key=#{ENV['SERVER_KEY']}"

  # GET https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=10&q=beyonce+karaoke&fields=items&key={YOUR_API_KEY}

  response = HTTParty.get(path)
  # p response = response.to_json
  p  "*" * 80 
  # p response["items"]
  # response = response.to_json
  # p response
  # GET https://www.googleapis.com/youtube/v3/search?q=radiohead&key={YOUR_API_KEY}
  # GET https://www.googleapis.com/youtube/v3/search


  @url = "https://www.youtube.com/watch?v="

  # videoId = response.items[1].id.videoId 
  # videoTitle = response.items[1].snippet.title
  # videoPhoto = response.items[1].snippet.thumbnails.default.url
  # thumbnail = items[1].snippet.thumbnails.default.url
  @songs = {} 

  response["items"].each_with_index do |item, index|
    @songs[index] = [ 
      item["snippet"]["title"],
      item["id"]["videoId"],
      item["snippet"]["thumbnails"]["default"]["url"]
    ]
  end
  
  # if request.xhr? send partial with locals {songs = songs }
   erb :'search/index'
end

post '/search' do 
  #post a video to list (params[:search_result])
end

