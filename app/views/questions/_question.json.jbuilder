json.extract! question, :id, :title, :description, :status, :asked_by, :answers_count, :created_at
json.url question_url(question, format: :json)
