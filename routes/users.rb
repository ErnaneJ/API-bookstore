namespace '/api/v1/users' do
    get '' do
        result = User.all.order(id: :asc).as_json
        halt(200, result.to_json)

        rescue Exception => e
            halt(500, {error: e.message}.to_json) 
    end
    
    post '/new' do
        values = JSON.parse(request.body.read)
        user = User.new(values)
        user.save
        halt(200, values.to_json)
        
        rescue Exception => e
            halt(500, {error: e.message}.to_json)
    end

    patch '/update/:id' do
        values = JSON.parse(request.body.read)
        user = User.find(params['id'])
        user.update(values)
        user.save
        halt(200, values.to_json)

        rescue Exception => e
            halt(500, {error: e.message}.to_json)
    end

    delete '/destroy/:id' do |id|
        User.destroy_by(id: id)
        halt(200, "Deleted User id = #{id}")

        rescue Exception => e
            halt(500, {error: e.message}.to_json)
    end
end