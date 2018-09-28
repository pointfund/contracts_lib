json.extract! lender, :id, :lend_name, :lend_contact, :lend_addr, :created_at, :updated_at
json.url lender_url(lender, format: :json)
