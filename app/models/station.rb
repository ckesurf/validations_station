class Station < ApplicationRecord
  has_many :platforms

  validates :name, presence: true, length: {minimum: 3}, uniqueness: true
  # at least 3 characters long
  # validates :name, length: {minimum: 3}
  # validates :name, uniqueness: true
end
