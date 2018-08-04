class AddColumnToPagePart < ActiveRecord::Migration[5.2]
  def change
    add_column :page_parts, :page_area, :integer
  end
end
