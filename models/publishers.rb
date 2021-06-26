class Publisher < ActiveRecord::Base
    after_destroy :log_destroy_action
    after_update :log_update_action
    after_create :log_create_action

    def log_destroy_action
      puts 'Editora deletada'
    end

    def log_update_action
      puts 'Editora Atualizada'
    end

    def log_create_action
      puts 'Editora Criada'
    end
end