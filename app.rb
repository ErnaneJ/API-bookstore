# gems
require 'rake'
require 'sinatra'
require 'sinatra/namespace'
require 'active_record'
require "sinatra/reloader" if development?

# configuracao do banco de dados
require './config/dbconfig.rb'
# set :database_file, "./config/database.yml" ?

# Models
require './models/users.rb'
require './models/books.rb'
require './models/likes.rb'
require './models/authors.rb'
require './models/publishers.rb'

# rotas
require './routes/users.rb'
require './routes/books.rb'
require './routes/likes.rb'
require './routes/authors.rb'
require './routes/publishers.rb'

get '/' do
  'Server on :)'
end

