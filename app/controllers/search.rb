get '/google817252d9e6d04b1e.html' do
  "google-site-verification: google817252d9e6d04b1e.html"
end

get '/search' do 
  query = params[:query]
  path = "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=10&"
  path += "q=#{query}"
  path += "&fields=items"
  path += "&key=#{ENV['SERVER_KEY']}"

  # GET https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=10&q=beyonce+karaoke&fields=items&key={YOUR_API_KEY}

  response = HTTParty.get(path)
  p  "*" * 80 


  @url = "https://www.youtube.com/watch?v="
  @songs = {} 

  response["items"].each_with_index do |item, index|
    @songs[index] = [ 
      item["snippet"]["title"],
      item["id"]["videoId"],
      item["snippet"]["thumbnails"]["default"]["url"]
    ]
  end
  
  # if request.xhr? send partial with locals {songs = songs }
  if request.xhr?
    erb :'search/index'
  else 
   erb :'search/index'
  end
end

post '/search' do 
  #post a video to list (params[:search_result])
end

