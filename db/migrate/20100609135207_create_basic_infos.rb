class CreateBasicInfos < ActiveRecord::Migration
  def self.up
    create_table :basic_infos do |t|
      t.string :website_title
      t.string :company_name
      t.string :company_address
      t.string :company_postcode
      t.string :company_phone
      t.string :company_fax
      t.string :company_email
      t.text :keywords
      t.text :website_description
      t.string :icp_serial_number

      t.timestamps
    end
  end

  def self.down
    drop_table :basic_infos
  end
end
