json.extract! user, :id, :name, :document, :cns, :email, :birthday_at, :phone, :status, :created_at, :updated_at
json.url user_url(user, format: :json)
