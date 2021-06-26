# Pega todos os users
get '/users' do
    result = User.all.order(id: :asc).as_json
    halt(200, result.to_json)
end

# Adiciona um novo user
post '/users/new' do
    values = JSON.parse(request.body.read)
    user = User.new(values)
    user.save
    halt(200, values.to_json)
end

# Atualiza um user
post '/users/update/:id' do
    values = JSON.parse(request.body.read)
    user = User.find(params['id'])
    user.update(values)
    user.save
    halt(200, values.to_json)
end

# Deleta user
post '/users/destroy/:id' do
    User.find_by(id: params[:id]).destroy
end
