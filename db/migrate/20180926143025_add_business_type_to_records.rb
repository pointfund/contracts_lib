class AddBusinessTypeToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :business_type, :integer
  end
end
