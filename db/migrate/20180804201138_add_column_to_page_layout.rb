class AddColumnToPageLayout < ActiveRecord::Migration[5.2]
  def change
    add_column :page_layouts, :page_area, :integer
  end
end
