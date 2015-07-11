#require gems
require 'sinatra'
require 'data_mapper'


#require models
require_relative 'models/link'

#require setup for DataMapper
require_relative 'data_mapper_setup'

#require_relative 'helpers/application'

#controls
get '/' do
  @links = links.all
  erb :'views/index'
end
