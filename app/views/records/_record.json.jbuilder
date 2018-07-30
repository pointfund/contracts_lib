json.extract! record, :id, :loan_name, :current_date, :client_first_name, :client_last_name, :created_at, :updated_at
json.url record_url(record, format: :json)
