class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_one :users
  default_scope { order(created_at: :desc) }
  validates :name, :summary, :start_date, presence: true
end
