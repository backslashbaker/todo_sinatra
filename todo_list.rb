require 'sinatra'
require 'slim'
require 'data_mapper'
require 'sinatra/reloader'

DataMapper.setup(:default, 'postgres://user:password@hostname/database')
class Task
	include DataMapper::Resource
	property :id, 	Serial
	property :name,	String, :required => true
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