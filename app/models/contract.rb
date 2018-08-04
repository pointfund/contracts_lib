class Contract < ApplicationRecord
	belongs_to :book
	has_many :page_parts
	has_many :page_layouts

end
