class Schedule < ActiveRecord::Base
	belongs_to :event
	belongs_to :user
	has_many :days, dependent: :destroy
	#attr_accessible :days_attributes

	accepts_nested_attributes_for :days, allow_destroy: true
end


