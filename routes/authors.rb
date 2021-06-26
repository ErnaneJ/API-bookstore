# Pega todos os authors
get '/authors' do
    result = Author.all.order(aut_id: :asc).as_json
    halt(200, result.to_json)
end


# Adiciona um novo author
post '/authors/new' do
    values = JSON.parse(request.body.read)
    author = Author.new(values)
    author.save
    halt(200, values.to_json)
end

# Atualiza um author
post '/authors/update/:id' do
    values = JSON.parse(request.body.read)
    author = Author.find(params['id'])
    author.update(values)
    author.save
    halt(200, values.to_json)
end

# Deleta author
post '/authors/destroy/:id' do
    Author.destroy_by(aut_id: params[:id])
end