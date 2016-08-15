# verification for google api call 
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
    p params
    erb :'search/_index', layout: false
  else 
   erb :'search/index'
  end
end

