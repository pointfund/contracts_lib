class AddPayPenToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :pay_pen, :string
  end
end
