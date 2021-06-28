class Author < ActiveRecord::Base
    has_and_belongs_to_many :books

    after_destroy :log_destroy_action
    after_update :log_update_action
    after_create :log_create_action

    def log_destroy_action
      puts '.:: Deleted Author'
    end

    def log_update_action
      puts '.:: Updated Author'
    end

    def log_create_action
      puts '.:: Created Author'
    end
end
