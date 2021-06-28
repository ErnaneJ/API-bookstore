namespace '/api/v1/likes' do
    get '' do
        result = Like.all.order(id: :asc).as_json
        halt(200, result.to_json)

        rescue Exception => e
            halt(500, {error: e.message}.to_json)
    end

    post '/new' do
        values = JSON.parse(request.body.read)
        like = Like.new(values)
        like.save
        halt(200, values.to_json)

        rescue Exception => e
            halt(500, {error: e.message}.to_json)
    end

    delete '/destroy/:id' do |id|
        if(Like.exists?(id))
            Like.destroy_by(id: id)
        else
            halt(200, {msg: "Like with id #{id} not found"}.to_json)
        end

        rescue Exception => e
            halt(500, {error: e.message}.to_json)
    end
end