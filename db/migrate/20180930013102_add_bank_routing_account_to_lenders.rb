class AddBankRoutingAccountToLenders < ActiveRecord::Migration[5.2]
  def change
    add_column :lenders, :bank_name, :string
    add_column :lenders, :bank_routing, :string
    add_column :lenders, :bank_account, :string
  end
end
