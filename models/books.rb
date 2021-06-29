class Book < ActiveRecord::Base
    has_and_belongs_to_many :authors

    after_destroy :log_destroy_action
    after_update :log_update_action
    after_create :log_create_action

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