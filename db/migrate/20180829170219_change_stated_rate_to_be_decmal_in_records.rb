class ChangeStatedRateToBeDecmalInRecords < ActiveRecord::Migration[5.2]
  	def change
		 change_column :records, :stated_rate, :decimal
	end

	def down
		 change_column :records, :stated_rate, :integer
	end
end
