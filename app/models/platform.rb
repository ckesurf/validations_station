class Platform < ApplicationRecord
  belongs_to :station
  has_many :assignments

  # platform_num must be an integer
  validates :platform_num, numericality: { 
    only_integer: true,
    # greater_than_or_equal_to: 1,
    # less_than_or_equal_to: 20
    # inclusion: { in: 1..20 }
    in: 1..20
  }, uniqueness: { scope: :station }

  # validates :platform_num, inclusion: { in: 1..20 }

  # validates :platform_num, uniqueness: { scope: :station }


  # platform_num must be in the range 1-20 (inclusive)
  # BONUS: platform_num must be unique to each station

end
