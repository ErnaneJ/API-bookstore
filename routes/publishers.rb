namespace '/api/v1/publishers' do
    get '' do
        result = Publisher.all.order(id: :asc).as_json
        halt(200, result.to_json)

        rescue Exception => e
            halt(500, {error: e.message}.to_json)
    end

    get '/:id_publisher/books' do |id_publisher|
        result = Book.publisher(id_publisher).order_by_id.as_json
        if result.blank?
            halt(200, {msg: "No books found published by the publisher of id #{id_publisher}"}.to_json)
        else
            halt(200, result.to_json)
        end

        rescue Exception => e
            halt(500, {error: e.message}.to_json)
    end

    post '/new' do
        values = JSON.parse(request.body.read)
        publisher = Publisher.new(values)
        publisher.save
        halt(200, values.to_json)

        rescue Exception => e
            halt(500, {error: e.message}.to_json)
    end

    patch '/update/:id' do
        values = JSON.parse(request.body.read)
        publisher = Publisher.find(params['id'])
        publisher.update(values)
        publisher.save
        halt(200, values.to_json)

        rescue Exception => e
            halt(500, {error: e.message}.to_json)
    end

    delete '/destroy/:id' do |id|
        if(Publisher.exists?(id))
            Publisher.destroy_by(id: id)
            Like.delete_by("ref_type = ? AND ref_id = ?", "publisher", id)
            halt(200, {msg: "Deleted Publisher id = #{id}"}.to_json)
          else
            halt(200, {msg: "Publisher with id #{id} not found"}.to_json)
        end
        rescue Exception => e
            halt(500, {error: e.message}.to_json)
    end
end