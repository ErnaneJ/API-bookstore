# Pega todas as publishers
get '/publishers' do
    result = Publisher.all.order(edit_id: :asc).as_json
    halt(200, result.to_json)
end

# Adiciona uma nova publisher
post '/publishers/new' do
    values = JSON.parse(request.body.read)
    publisher = Publisher.new(values)
    publisher.save
    halt(200, values.to_json)
end

# Atualiza uma publisher
post '/publishers/update/:id' do
    values = JSON.parse(request.body.read)
    publisher = Publisher.find(params['id'])
    publisher.update(values)
    publisher.save
    halt(200, values.to_json)
end

# Deleta uma publisher
post '/publishers/destroy/:id' do
    Publisher.find_by(id: params[:id]).destroy
end

