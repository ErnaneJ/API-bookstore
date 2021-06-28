class Like < ActiveRecord::Base
    after_destroy :log_destroy_action
    after_create :log_create_action

    def log_destroy_action
      puts '.:: Deleted Like'
    end

    def log_create_action
      puts '.:: Created Like'
    end
end