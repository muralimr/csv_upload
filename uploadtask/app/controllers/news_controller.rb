class NewsController < ApplicationController
  require "net/http"
  def index
  	@news_list = News.all
  	render json: @news_list
  end


  def get_api_data
  	@dat_fetch = Net::HTTP.get(URI.parse("https://newsapi.org/v2/top-headlines?sources=google-news&apiKey=0a708bae59cd4f92b26a6bc4c114f1f0"))

  	@dat_fetch[:articles].each do |l|
  		News.create(source: l.source, author: l.author, title: l.title, description: l.description, url: l.url, urlToImage: l.urlToImage, publishedAt: l.publishedAt, content: l.content)
  	end

  end
end
