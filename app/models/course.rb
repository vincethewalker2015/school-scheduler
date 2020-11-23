class Course < ApplicationRecord
  validates :short_name, presence: true
  validates :name, presence: true
  validates :description, presence: true

  belongs_to :student
  # validates :student_id, presence: true
end
