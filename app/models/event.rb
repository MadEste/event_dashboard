class Event < ActiveRecord::Base
	before_save :sanitize_url
	belongs_to :user
	has_many :links, dependent: :destroy
	has_one :schedule, dependent: :destroy
	has_many :assets, dependent: :destroy
	has_many :days, through: :schedule

	accepts_nested_attributes_for :links, reject_if: :all_blank, allow_destroy: true
	accepts_nested_attributes_for :schedule, allow_destroy: true
	accepts_nested_attributes_for :assets, allow_destroy: true
	accepts_nested_attributes_for :days, allow_destroy: true

	validates :name, :description, presence: true

	private

	def sanitize_url
	   puts "Running Sanitize URL"
	   links.each do |lnk|
	   #	puts "Current Link URL : #{lnk.url}"
	   	lnk.url = "http://#{lnk.url}" unless lnk.url=~/^https?:\/\//
	   end
	    # url = "http://#{url}" unless url =~ /^https?:\/\//
	end 

end
