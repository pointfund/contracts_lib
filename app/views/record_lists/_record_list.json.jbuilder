json.extract! record_list, :id, :contract_id, :var_list, :created_at, :updated_at
json.url record_list_url(record_list, format: :json)
