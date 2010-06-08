class CreateHits < ActiveRecord::Migration
  def self.up
    create_table :hits do |t|
      t.string :hitable_type
      t.integer :hitable_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :hits
  end
end
