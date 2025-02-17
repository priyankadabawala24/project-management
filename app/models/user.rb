class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :projects
  has_many :project_histories, through: :project

  def admin?
    self.role == "admin" 
  end

  def member?
    self.role == "member" 
  end
end
