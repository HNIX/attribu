json.extract! campaign, :id, :title, :description, :tenant_id, :created_at, :updated_at
json.url campaign_url(campaign, format: :json)
