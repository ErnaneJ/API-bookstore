class User < ActiveRecord::Base
    has_many :likes, dependent: :destroy

    after_destroy :log_destroy_action
    after_update :log_update_action
    after_create :log_create_action
    
    scope :order_by_id, -> {order(id: :asc)}
    scope :likes, -> {find_by_sql("SELECT users.id, name, user_id AS 'like_from_user_id' FROM users, likes WHERE users.id = likes.ref_id AND ref_type = 'user' ORDER BY users.id ASC")}

    def log_destroy_action
      puts ".:: Deleted User #{id}"
      Like.delete_by("ref_type = ? AND ref_id = ?", "author", id)
    end

    def log_update_action
      puts ".:: Updated User #{id}"
    end

    def log_create_action
      puts ".:: Created User #{id}"
    end  
end