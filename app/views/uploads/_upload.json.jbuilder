json.extract! upload, :id, :name, :description, :version, :user_id, :created_at, :updated_at
json.url upload_url(upload, format: :json)
