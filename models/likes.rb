class Like < ActiveRecord::Base
    after_destroy :log_destroy_action
    after_create :log_create_action

    scope :type, -> (type){ where("ref_type = ?",type) }
    scope :order_by_id, -> {order(id: :asc)}

    def log_destroy_action
      puts ".:: Deleted Like #{id}"
    end

    def log_create_action
      puts ".:: Created Like #{id}"
    end
end