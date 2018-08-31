class PageLayout < ApplicationRecord
		# belongs_to :contract
	def self.to_csv
		attributes = %w{contract_id	page_area name posx	posy}
		CSV.generate(headers: true) do |csv|
			csv << attributes
			all.each do |item|
				csv << item.attributes.values_at(*attributes)
			end
		end
	end
end
