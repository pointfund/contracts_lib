class ChangeDailyLateFeeToBeDecimalInRecords < ActiveRecord::Migration[5.2]
	def change
		 change_column :records, :daily_late_fee, :decimal
	end

	def down
		 change_column :records, :daily_late_fee, :integer
	end


end
