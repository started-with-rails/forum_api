json.extract! answer, :id, :answer, :question_id, :user_id, :created_at, :updated_at
json.url question_answer_url(@question,answer,format: :json)
