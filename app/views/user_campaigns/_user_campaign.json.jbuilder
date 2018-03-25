json.extract! user_campaign, :id, :campaign_id, :user_id, :created_at, :updated_at
json.url user_campaign_url(user_campaign, format: :json)
