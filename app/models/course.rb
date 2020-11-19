class Course < ApplicationRecord
  validates :short_name, presence: true
  validates :name, presence: true
  validates :description, presence: true
end
