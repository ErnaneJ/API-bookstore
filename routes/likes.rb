get '/likes' do
    result = Like.all.order(id: :asc).as_json
    halt(200, result.to_json)
end

# Adiciona um novo Like
post '/likes/new' do
    values = JSON.parse(request.body.read)
    like = Like.new(values)
    like.save
    halt(200, values.to_json)
end

# Deleta Like
post '/likes/destroy/:id' do
    Like.find_by(id: params[:id]).destroy
end