json.extract! question, :id, :title, :description, :status, :asked_by, :answers_count, :tag_list, :created_at
json.url question_url(question, format: :json)
