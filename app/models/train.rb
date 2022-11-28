class Train < ApplicationRecord
  has_many :assignments
  has_many :platforms, through: :assignments
  # must have an origin and a destination
  # validates :origin, presence: true
  # validates :origin, :destination, length: { in: 3..24 }
  validates :origin, :destination, length: { minimum: 3, maximum: 24 }

  # validates :service_type, acceptance: {
  #   accept: ['express', 'local']
  # }

  # validates :service_type, inclusion: { in: ['express', 'local']}
  validates :service_type, inclusion: ['express', 'local']

# origin and destination strings must be between 3 and 24 characters long, inclusive
# service_type must be either "express" or "local"

end
