class CreateLenders < ActiveRecord::Migration[5.2]
  def change
    create_table :lenders do |t|
      t.string :lend_name
      t.string :lend_contact
      t.string :lend_addr
      t.string :lend_city
      t.string :lend_state
      t.string :lend_zip
      t.string :lend_email
      t.string :lend_phone
      t.string :lend_notes
      t.string :lend_memo

      t.timestamps
    end
  end
end
