json.extract! squad, :id, :name, :sport, :owner_id, :created_at, :updated_at
json.url api_v1_squad_url(squad, format: :json)
