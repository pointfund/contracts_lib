class CreateAgencies < ActiveRecord::Migration[5.2]
  def change
    create_table :agencies do |t|
      t.string :agt_busi_name
      t.string :agt_num
      t.string :agt_name
      t.string :agt_addr
      t.string :agt_city
      t.string :agt_state
      t.string :agt_zip
      t.string :agt_email
      t.string :agt_phone
      t.string :agt_notes
      t.string :agt_memo



      t.timestamps
    end
  end
end
