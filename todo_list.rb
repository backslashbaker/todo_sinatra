require 'rubygems'
require 'sinatra'
require 'slim'
require 'dm-postgres-adapter'
require 'data_mapper'
require 'sinatra/reloader'

configure :development do
	DataMapper.setup(:default, 'postgres://user:password@hostname/database')
end

class Task
	include DataMapper::Resource
	property :id, 	        Serial
	property :name,	        String, :required => true
	property :completed_at, DateTime
end

DataMapper.finalize


get '/' do

	slim :index	

end

get '/:task' do
	@task = params[:task].split('-').join(' ').capitalize
	slim :task
end

post '/' do
	@task = params[:task]
	slim :task
end