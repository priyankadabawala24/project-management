class ProjectHistory < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validates :action, presence: true
  validates :context, presence: true
end
