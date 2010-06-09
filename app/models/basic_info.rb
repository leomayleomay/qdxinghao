class BasicInfo < ActiveRecord::Base
  validates_presence_of :website_title, :company_name, :company_address, :company_postcode, :company_phone, :company_fax, :company_email, :keywords, :website_description, :icp_serial_number
end
