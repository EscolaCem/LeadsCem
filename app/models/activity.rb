class Activity < ApplicationRecord

  belongs_to :ticket
  belongs_to :user
  

  def show
   @activities = @ticket.activities.where("created_at < ?", 3.days.ago)
   @activity = Activity.new
 end
end
