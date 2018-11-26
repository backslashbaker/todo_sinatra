require 'sinatra'
require 'sinatra/reloader'

list_of_items = []



get '/' do
    item = params["item"]

    list_of_items << item
    erb :index, :locals => {:item => item, :list_of_items => list_of_items}
  end