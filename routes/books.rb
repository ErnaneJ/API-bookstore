#retorna todos os books
get '/books' do
  result = Book.all.order(id: :asc).as_json
  halt(200, result.to_json)
end

#retorna a partir de um filtro
get '/books/:filter' do
  if params['filter'] == 'published'
    result = Book.where(liv_publicado:true).all.as_json
    halt(200, result.to_json)

  elsif params['filter'] == 'unpublished'
    result = Book.where(liv_publicado:false).all.as_json
    halt(200, result.to_json)
  else
    result = Book.find(params['filter']).as_json
    halt(200, result.to_json)
  end
end

#Adiciona
post '/books/new' do
  values = JSON.parse(request.body.read)
  book = Book.new(values)
  book.save
  halt(200, values.to_json)
end
#Atualiza
post '/books/update/:id' do
  values = JSON.parse(request.body.read)
  book = Book.find(params['id'])
  book.update(values)
  book.save
  halt(200, values.to_json)
end

#Deleta
post '/books/destroy/:id' do 
  Book.find_by(id: params[:id]).destroy
end