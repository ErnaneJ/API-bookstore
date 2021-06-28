class User < ActiveRecord::Base
    has_many :likes, dependent: :destroy

    after_destroy :log_destroy_action
    after_update :log_update_action
    after_create :log_create_action

    def log_destroy_action
      puts '.:: Deleted User'
    end

    def log_update_action
      puts '.:: Updated User'
    end

    def log_create_action
      puts '.:: Created User'
    end
end