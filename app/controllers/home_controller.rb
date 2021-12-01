class HomeController < ApplicationController
  require 'faraday'
  def index
    header= {
      'x-api-key': 'f7b9d205dcb44ed7b3d3b6b8357a6764'
    }
    response = Faraday.get("https://newsapi.org/v2/everything?q=tesla&apiKey=f7b9d205dcb44ed7b3d3b6b8357a6764")
    @news = JSON.parse(response.body)
  end

  def show
    unless params[:query].nil?
      response = Faraday.get("https://newsapi.org/v2/everything?q=#{params[:query]}&apiKey=f7b9d205dcb44ed7b3d3b6b8357a6764")
    end
    @news = JSON.parse(response.body)
  end

end
