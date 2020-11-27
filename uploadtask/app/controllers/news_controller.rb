class NewsController < ApplicationController
  require "net/http"
  def index
  	@news_list = News.all
  	render json: @news_list
  end


  def get_api_data
      url = "https://newsapi.org/v2/top-headlines?sources=google-news&apiKey=0a708bae59cd4f92b26a6bc4c114f1f0"
      resp = Net::HTTP.get_response(URI.parse(url))
      data = JSON.parse(resp.body)

      data["articles"].each do |i|
      
     News.create(source: i["source"], author: i["author"], title: i["title"], description: i["description"], url: i["url"], urlToImage: i["urlToImage"], publishedAt: i["publishedAt"], content: i["content"])
      
        end
      render json: data["articles"]


  end





end
