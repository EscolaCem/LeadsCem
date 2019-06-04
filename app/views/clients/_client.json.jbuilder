json.extract! client, :id, :name, :email, :matricula, :phone, :created_at, :updated_at
json.url client_url(client, format: :json)
