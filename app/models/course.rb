class Course < ApplicationRecord
  validates :short_name, presence: true
  validates :name, presence: true
  validates :description, presence: true
  has_many :student_courses
  has_many :students, through: :student_courses
  # validates :student_id, presence: true
end
