class Asset < ActiveRecord::Base
	belongs_to :event
	
	has_attached_file :uploaded_file, 
		:path => "assets/:id/:basename.:extension",
		:storage => :s3,
		:s3_credentials => "#{Rails.root}/config/amazon_s3.yml",
		:bucket => "eventdash",
		:url => ":s3_domain_url"
	do_not_validate_attachment_file_type :uploaded_file
	validates_attachment_size :uploaded_file, :less_than => 10.megabytes
	validates_attachment_presence :uploaded_file

	def file_name 
		uploaded_file_file_name 
	end
end
