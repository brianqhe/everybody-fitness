json.extract! profile, :id, :first_name, :last_name, :sex, :city, :biography, :user_id, :created_at, :updated_at
json.url profile_url(profile, format: :json)
