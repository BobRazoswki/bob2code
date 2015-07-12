#require gems
require 'sinatra'
require 'data_mapper'
require 'rack-flash'
require 'rest_client'

#require models
require_relative 'models/link'

#require setup for DataMapper
require_relative 'data_mapper_setup'

#require_relative 'helpers/application'

#controls

get '/' do
  @links = Link.all
  erb :"/index"
end

post '/links' do
  link = Link.new
  link.attributes = {:url => params["Url"], :title => params["Title"]}
  link.save
  redirect to('/')
end

get 'links/new' do
	erb :"links/new"
end
