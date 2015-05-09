class Event < ActiveRecord::Base
	belongs_to :user
	has_many :links, dependent: :destroy

	accepts_nested_attributes_for :links, reject_if: :all_blank, allow_destroy: true

	validates :name, :description, presence: true

end
