json.extract! answer, :id, :answer, :question_id, :answered_by, :created_at
json.url question_answer_url(@question,answer,format: :json)
