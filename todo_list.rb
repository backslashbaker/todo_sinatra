require 'rubygems'
require 'sinatra'
require 'slim'
require_relative 'models/task.rb'

configure :development do
  set :database, {adapter: 'postgresql',  encoding: 'unicode', database: 'todo', pool: 2, username: 'derekbaker', password: ''}
end


get '/' do
	@tasks = Task.all
	slim :index	

end

get '/:task' do
	@task = params[:task].split('-').join(' ').capitalize
	slim :task
end

post '/' do
	Task.create params[:task]
	redirect to('/')
end

delete '/task/:id' do
	Task.get(params[:id]).destroy
	redirect to('/')
end

