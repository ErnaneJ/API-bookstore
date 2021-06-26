class Usuario < ActiveRecord::Base
    after_destroy :log_destroy_action
    after_update :log_update_action
    after_create :log_create_action

    def log_destroy_action
      puts 'Usuario deletado'
    end

    def log_update_action
      puts 'Usuario Atualizado'
    end

    def log_create_action
      puts 'Usuario Criado'
    end
end