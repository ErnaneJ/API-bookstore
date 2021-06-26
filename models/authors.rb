class Author < ActiveRecord::Base
    has_and_belongs_to_many :books

    after_destroy :log_destroy_action
    after_update :log_update_action
    after_create :log_create_action

    def log_destroy_action
      puts 'Autor deletado'
    end

    def log_update_action
      puts 'Autor Atualizado'
    end

    def log_create_action
      puts 'Autor Criado'
    end
end
