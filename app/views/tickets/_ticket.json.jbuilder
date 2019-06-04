json.extract! ticket, :id, :status, :problem, :course_id, :user_id, :client_id, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
