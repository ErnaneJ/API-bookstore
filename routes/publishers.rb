namespace '/api/v1/publishers' do
    get '' do
        result = Publisher.all.order(id: :asc).as_json
        halt(200, result.to_json)
    end

    post '/new' do
        values = JSON.parse(request.body.read)
        publisher = Publisher.new(values)
        publisher.save
        halt(200, values.to_json)
    end

    patch '/update/:id' do
        values = JSON.parse(request.body.read)
        publisher = Publisher.find(params['id'])
        publisher.update(values)
        publisher.save
        halt(200, values.to_json)
    end

    delete '/destroy/:id' do |id|
        Publisher.destroy_by(id: id)
        halt(200, "Deleted Publisher id = #{id}")
    end
end