class AddLoanAccoutToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :loan_account_num, :string
  end
end
