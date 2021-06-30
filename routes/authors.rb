namespace '/api/v1/authors' do
    get '' do
        authors = Author.all.order_by_id.as_json
        halt(200, authors.to_json)

        rescue Exception => e
            halt(500, {error: e.message}.to_json)
    end

    get '/:id_author/books' do |id_author|
        books_author = Author.find(id_author).books
        if books_author.blank?
            halt(200, {msg: "No books found published by the author of id #{id_publisher}"}.to_json)
        else
            halt(200, books_author.to_json)
        end

        rescue Exception => e
            halt(500, {error: e.message}.to_json)
    end

    post '/new' do
        values = JSON.parse(request.body.read)
        author = Author.new(values)
        author.save
        halt(200, values.to_json)

        rescue Exception => e
            halt(500, {error: e.message}.to_json)
    end

    patch '/update/:id' do
        values = JSON.parse(request.body.read)
        author = Author.find(params['id'])
        author.update(values)
        author.save
        halt(200, values.to_json)
        
        rescue Exception => e
            halt(500, {error: e.message}.to_json)
    end

    delete '/destroy/:id' do |id|
        if(Author.exists?(id))
            Author.destroy_by(id: id)
            halt(200, {msg: "Deleted Author id = #{id}"}.to_json)
          else
            halt(200, {msg: "Author with id #{id} not found"}.to_json)
        end
        halt(200, "Deleted author id = #{id}")

        rescue Exception => e
            halt(500, {error: e.message}.to_json)
    end
end