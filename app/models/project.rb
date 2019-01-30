class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy
  
  default_scope { order(created_at: :desc) }
  validates :name, :summary, :start_date, presence: true
  validates :summary, length: { maximum: 300 }
end
