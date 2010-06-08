class CreateRecruitments < ActiveRecord::Migration
  def self.up
    create_table :recruitments do |t|
      t.string :title
      t.string :address
      t.integer :amount
      t.integer :salary
      t.date :ended_at
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :recruitments
  end
end
