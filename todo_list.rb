require 'sinatra'
require 'sinatra/reloader'

list_of_items = []

get '/' do
	todo = params["item"]
	list_of_items << todo

	erb :index, :locals => {:todo => todo, :list_of_items => list_of_items}
end