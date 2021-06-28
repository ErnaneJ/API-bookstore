namespace '/api/v1/likes' do
    get '' do
        result = Like.all.order(id: :asc).as_json
        halt(200, result.to_json)
    end

    post '/new' do
        values = JSON.parse(request.body.read)
        like = Like.new(values)
        like.save
        halt(200, values.to_json)
    end

    delete '/destroy/:id' do |id|
        Like.destroy_by(id: id)
        halt(200, "Deleted like id = #{id}")
    end
end