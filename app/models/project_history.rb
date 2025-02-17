class ProjectHistory < ApplicationRecord
  belongs_to :project
  has_one :user, through: :project

  validates :action, presence: true
  validates :context, presence: true
end
