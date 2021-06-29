class CreateBooks < ActiveRecord::Migration[6.0]
    has_and_belongs_to_many :authors
    def up
      create_table :books do |t|
        t.string :name
        t.boolean :published, :default => false
        t.float :value
        t.references :publisher_id, foreign_key: { to_table: :publishers }

        t.timestamps
      end
    end
   
    def down
      drop_table :books
    end
  end