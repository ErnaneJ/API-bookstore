class CreateAuthors < ActiveRecord::Migration[6.0]
    has_and_belongs_to_many :books
    def up
      create_table :authors do |t|
        t.string :name
        t.date :birth_date
        
        t.timestamps
      end
    end
   
    def down
      drop_table :authors
    end
  end