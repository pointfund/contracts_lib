class CreatePageParts < ActiveRecord::Migration[5.2]
  def change
    create_table :page_parts do |t|
      t.string :name
      t.integer :contract_id
      t.text :content

      t.timestamps
    end
  end
end
