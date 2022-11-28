class Assignment < ApplicationRecord
  belongs_to :platform
  belongs_to :train

  validate :is_available

  # Assignment
  # must have arrival and departure times
  # BONUS (see the docs on custom validation methods to help with these):

  # must arrive before it departs
  # must not stay at platform for more than 20 minutes
  def duration
    (self.departure - self.arrival)/60
    # how long the train is at a particular station
  end
  
  # must only be assigned to a vacant platform
  def is_available
    # The arrival of your new assignment cannot be between the arrival time and departure time of another assignment at the same platform.
    puts "hello, its running"
    # look at all assignments at this particular platform
    current_assignments = self.platform.assignments
    current_assignments.each do |assignment|
      # if my new arrival is after this arrival and its before this departure time, conflict
      # in other words, 
      # if this train arrives after another assignment,
      # then there will be a conflict if this train is also arriving BEFORE that assignment departs
      if self.arrival >= assignment.arrival && self.arrival <= assignment.departure
        errors.add(:platform, 'is occupied')
      end

      # if my new arrival is before this arrival and my departure is after this assignment's arrival time, conflict
      # in other words,
      # if this train arrives before another assignment,
      # then there will be a conflict if this train departs AFTER that assignment departs
      if self.arrival <= assignment.arrival && self.departure >= assignment.arrival
        errors.add(:platform, 'is occupied')
      end
    end
  end
end
