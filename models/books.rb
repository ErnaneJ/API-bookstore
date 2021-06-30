class Book < ActiveRecord::Base
    has_and_belongs_to_many :authors

    after_destroy :log_destroy_action
    after_update :log_update_action
    after_create :log_create_action

    scope :published, -> { where(published: true) }
    scope :unpublished, -> { where(published: false) }
    scope :price, -> (value){ where("value <= ?", value) }
    scope :publisher, -> (id){ where("publisher_id = ?",id) }
    scope :order_by_id, -> {order(id: :asc)}
    scope :likes, -> {find_by_sql("SELECT books.id, name, published, user_id AS 'like_from_user_id' FROM books, likes WHERE books.id = likes.ref_id AND ref_type = 'book' ORDER BY books.id ASC")}

    def log_destroy_action
      puts ".:: Deleted Book '#{id}'"
      Like.delete_by("ref_type = ? AND ref_id = ?", "book", id)
    end

    def log_update_action
      puts ".:: Updated Book #{id}"
    end

    def log_create_action
      puts ".:: Created Book #{id}"
    end
end