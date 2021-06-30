class Author < ActiveRecord::Base
    has_and_belongs_to_many :books

    after_destroy :log_destroy_action
    after_update :log_update_action
    after_create :log_create_action

    scope :likes, -> {find_by_sql("SELECT authors.id, name, birth_date, user_id AS 'like_from_user_id' FROM authors, likes WHERE authors.id = likes.ref_id AND ref_type = 'author' ORDER BY authors.id ASC")}
    scope :after_date, -> (time){where("birth_date >= ?", time)}
    scope :before_date, -> (time){where("birth_date <= ?", time)}
    scope :with_name, -> (n){where("name = ?", n)}
    scope :order_by_id, -> {order(id: :asc)}

    def log_destroy_action
      puts ".:: Deleted Author #{id}"
      Like.delete_by("ref_type = ? AND ref_id = ?", "author", id)
    end

    def log_update_action
      puts ".:: Updated Author #{id}"
    end

    def log_create_action
      puts ".:: Created Author #{id}"
    end
end
