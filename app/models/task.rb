class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user
  default_scope { order(status: :desc) }
  validates :title, :description, :status, presence: true
  STATUSTASKS=[
  ['New','New'],
  ['In_Progress','In_Progress'],
  ['Done','Done']
]


end
