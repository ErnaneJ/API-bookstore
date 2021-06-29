class Publisher < ActiveRecord::Base
    has_many :books, dependent: :destroy

    after_destroy :log_destroy_action
    after_update :log_update_action
    after_create :log_create_action

    def log_destroy_action
      puts ".:: Deleted Publisher #{id}"
      Like.delete_by("ref_type = ? AND ref_id = ?", "author", id)
    end

    def log_update_action
      puts ".:: Updated Publisher #{id}"
    end

    def log_create_action
      puts ".:: Created Publisher #{id}"
    end
end