json.extract! newuser, :id, :name, :email, :login, :created_at, :updated_at
json.url newuser_url(newuser, format: :json)
