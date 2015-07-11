#require gems
require 'sinatra'
require 'data_mapper'

#require models
require './app/models/link'

#require setup for DataMapper
require_relative 'data_mapper_setup'
#require_relative 'helpers/application'

#controls
get '/' do
  'Hello Nandos'
end
