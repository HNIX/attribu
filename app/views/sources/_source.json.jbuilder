json.extract! source, :id, :name, :medium, :url, :created_at, :updated_at
json.url source_url(source, format: :json)
