class AddPaymentAccountAssignmentCheckToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :payment_type, :integer
    add_column :records, :account_type, :integer
    add_column :records, :assignment_type, :integer
    add_column :records, :check_type, :integer
  end
end
