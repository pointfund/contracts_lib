class CreatePageLayouts < ActiveRecord::Migration[5.2]
  def change
    create_table :page_layouts do |t|
      t.string :name
      t.integer :posx
      t.integer :posy
      t.integer :page_part
      t.integer :contract_id

      t.timestamps
    end
  end
end
