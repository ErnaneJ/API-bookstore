namespace '/api/v1/books' do
  get '' do
    result = Book.all.order_by_id    
    halt(200, result.to_json)
  end

  get '/:filter' do |filter|
    if filter == 'published'
      result = Book.published.as_json
      halt(200, result.to_json)
    elsif filter == 'unpublished'
      result = Book.unpublished.as_json
      halt(200, result.to_json)
    else
      result = Book.find(filter).as_json
      halt(200, result.to_json)
    end
  end

  get '/publisher/:id_publisher' do |id_publisher|
    result = Book.publisher(id_publisher).order_by_id.as_json
    if result.blank?
        halt(200, {msg: "No books found published by the publisher of id #{id_publisher}"}.to_json)
    else
        halt(200, result.to_json)
    end

    rescue Exception => e
        halt(500, {error: e.message}.to_json)
  end

  get '/author/:id_author' do |id_author|
    books_author = Author.find(id_author).books
    if books_author.blank?
        halt(200, {msg: "No books found published by the author of id #{id_publisher}"}.to_json)
    else
        halt(200, books_author.to_json)
    end

    rescue Exception => e
        halt(500, {error: e.message}.to_json)
  end

  get '/price/:filter' do |filter|
      result = Book.price(filter).as_json
      halt(200, result.to_json)
  end

  post '/new' do
    values = JSON.parse(request.body.read)
    book = Book.new(values)
    book.save
    halt(200, values.to_json)

    rescue Exception => e
      halt(500, {error: e.message}.to_json)
  end

  patch '/update/:id' do
    values = JSON.parse(request.body.read)
    book = Book.find(params['id'])
    book.update(values)
    book.save
    halt(200, values.to_json)

    rescue Exception => e
      halt(500, {error: e.message}.to_json)
  end

  delete '/destroy/:id' do |id|
    if(Book.exists?(id))
      Book.destroy_by(id: id)
      halt(200, {msg: "Deleted book id = #{id}"}.to_json)
    else
      halt(200, {msg: "book with id #{id} not found"}.to_json)
    end

    rescue Exception => e
      halt(500, {error: e.message}.to_json)
  end
end