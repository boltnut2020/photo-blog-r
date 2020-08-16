require 'net/http'

API_KEY = 'AIzaSyAnqr4PPzc6E7CPDuOEP336OH4FLsaqJRo'

class Api::YoutubeController < ApplicationController
  def show
  	search("hoge")
  end
  
  def search(q)
    # APIキーは自分のものを用意
    query = q
    next_page_token = nil
    params = URI.encode_www_form({
    	part: "snippet",
    	maxResults: "50",
    	key: API_KEY,
    	q: query,
    	type: "video"
    })
  
    uri = URI.parse("https://www.googleapis.com/youtube/v3/search?#{params}")
    @query = uri.query
    
   	response = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
	    http.get(uri.request_uri)
   	end
    
    # 例外処理は省略
    @result = JSON.parse(response.body)
    
    # itemsを参照すれば動画オブジェクトを取得できる
    @result["items"].each do |item|
			youtube = Youtube.find_or_create_by(videoId: item['videoId'].to_s )
			youtube.videoId = item['videoId'].to_s
  		youtube.title = item['snippet']['title'].to_s.force_encoding('UTF-8').scrub('')
      youtube.snippet = item['snippet'].to_s.force_encoding('UTF-8').scrub('')
      
      youtube.save!
    # 処理...
		end
	end
end
