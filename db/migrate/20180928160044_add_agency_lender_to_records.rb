class AddAgencyLenderToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :agt_id, :integer
    add_column :records, :lend_id, :integer
  end
end
