class Job < ActiveRecord::Base
  include Wizard

  first_step  = lambda { |r| r.current_step == r.steps[0] }
  second_step = lambda { |r| r.current_step == r.steps[1] }
  third_step  = lambda { |r| r.current_step == r.steps[2] }
  fourth_step = lambda { |r| r.current_step == r.steps[3] }

  # first step validation
  validates :device_id, presence: true, if: first_step

  # second step validation
  validates :model_id, presence: true, if: second_step

  # third step validation
  validates :problem_id, presence: true, if: third_step

  # fourth step validations
  validates :name, length: {in: 1..100 },  presence: true, if: fourth_step
  validates :email, length: {in: 1..100 },  presence: true, if: fourth_step
  validates :phone_number, length: {in: 1..100 }, numericality: true, presence: true, if: fourth_step

  def steps
    %w[ device model problem ]
  end


end
