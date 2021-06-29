class CreatePublishers < ActiveRecord::Migration[6.0]
    def up
      create_table :publishers do |t|
        t.string :name
        
        t.timestamps
      end
    end
   
    def down
      drop_table :publishers
    end
  end