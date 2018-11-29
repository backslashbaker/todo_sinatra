require 'rubygems'
require 'sinatra'
require 'slim'
require 'sinatra/reloader'

configure :development do
  set :database, {adapter: 'postgresql',  encoding: 'unicode', database: 'todo', pool: 2, username: 'your_username', password: 'your_password'}
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