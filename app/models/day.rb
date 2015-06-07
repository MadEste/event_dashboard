class Day < ActiveRecord::Base
	belongs_to :schedule
	has_many :dayevents, dependent: :destroy

	accepts_nested_attributes_for :dayevents, allow_destroy: :true
end
