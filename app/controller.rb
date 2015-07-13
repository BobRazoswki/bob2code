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
  Link.create(:url => params["Url"], :title => params["Title"])
  redirect to('/')
end

get 'links/new' do
	erb :"links/new"
end

delete '/links/:id' do
  Link.get(params["id"]).destroy
  redirect to('/')
end

get '/links/update' do
  erb :'links/update'
end

post '/links/:id' do
  Link.get(params["id"]).update(:url => params["Url_up"], :title => params["Title_up"])
  redirect to('/')
end

# get '/links/:id' do
#   redirect to('/')
# end
