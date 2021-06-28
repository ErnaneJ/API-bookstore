namespace '/api/v1/books' do

  get '' do
    result = Book.all.order(id: :asc).as_json
    halt(200, result.to_json)
  end

  get '/:filter' do
    if params['filter'] == 'published'
      result = Book.where(published:true).all.as_json
      halt(200, result.to_json)

    elsif params['filter'] == 'unpublished'
      result = Book.where(published:false).all.as_json
      halt(200, result.to_json)
    else
      result = Book.find(params['filter']).as_json
      halt(200, result.to_json)
    end
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
    Book.destroy_by(id: id)
    halt(200, "Deleted book id = #{id}")

    rescue Exception => e
      halt(500, {error: e.message}.to_json)
  end
end