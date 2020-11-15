json.extract! transaction, :id, :type, :string, :title, :value, :category_id, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
