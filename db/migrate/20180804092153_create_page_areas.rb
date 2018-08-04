class CreatePageAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :page_areas do |t|
      t.integer :contract_id
      t.integer :section_id
      t.integer :area

      t.timestamps
    end
  end
end
