class CreateContracts < ActiveRecord::Migration[5.2]
  def change
    create_table :contracts do |t|
      t.string :name
      t.integer :sections
      t.integer :book_id

      t.timestamps
    end
  end
end
