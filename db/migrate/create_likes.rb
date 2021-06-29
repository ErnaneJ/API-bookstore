class CreateLikes< ActiveRecord::Migration[6.0]
    def up
      create_table :likes do |t|
        t.integer :user_id
        t.string :ref_type
        t.integer :ref_id
   
        t.timestamps
      end
    end
   
    def down
      drop_table :likes
    end
  end