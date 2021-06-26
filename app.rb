# gems
require 'rubygems'
require 'sinatra'
require 'active_record'
require "sinatra/reloader" if development?

# configuracao do banco de dados
require './config/dbconfig.rb'

# Models
require './models/users.rb'
require './models/books.rb'
require './models/likes.rb'
require './models/authors.rb'
require './models/publishers.rb'

require './models/authors_books.rb'

# rotas
require './routes/users.rb'
require './routes/books.rb'
require './routes/likes.rb'
require './routes/authors.rb'
require './routes/publishers.rb'


get '/' do
  'ok'
end

