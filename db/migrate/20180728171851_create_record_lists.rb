class CreateRecordLists < ActiveRecord::Migration[5.2]
  def change
    create_table :record_lists do |t|
      t.integer :contract_id
      t.string :var_list

      t.timestamps
    end
  end
end
