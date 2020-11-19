json.extract! transaction, :id, :title, :description, :date, :value, :type, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
