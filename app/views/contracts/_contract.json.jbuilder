json.extract! contract, :id, :name, :sections, :book_id, :created_at, :updated_at
json.url contract_url(contract, format: :json)

json.extract! page_part, :id, :name, :content, :contract_id, :created_at, :updated_at
json.url page_part_url(page_part, format: :json)

json.extract! page_layout, :id, :name, :posx, :posy, :page_part, :contract_id, :created_at, :updated_at
json.url page_layout_url(page_layout, format: :json)

