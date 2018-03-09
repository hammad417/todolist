json.extract! task, :id, :body, :list_id, :state_cd, :created_at, :updated_at
json.url task_url(task, format: :json)
