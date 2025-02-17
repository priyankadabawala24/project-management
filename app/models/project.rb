class Project < ApplicationRecord
  belongs_to :user
  has_many :project_histories

  def change_status(new_status, current_user) 
    return unless ["New", "In Progress", "Completed", "On hold"].include? new_status

    transaction do
      update!(status: new_status)
      self.project_histories.create!(action: "status_changed", context: "The status is changed to #{new_status}", user_id: current_user.id)
    end
  end

  def add_comment(comment, current_user)
    self.project_histories.create!(action: "comment", context: comment, user_id: current_user.id)
  end
end
