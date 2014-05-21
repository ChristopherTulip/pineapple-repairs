class Job < ActiveRecord::Base
  include Wizard

  belongs_to :device
  belongs_to :model
  belongs_to :problem
  belongs_to :network
  belongs_to :location
  belongs_to :contractor

  first_step  = lambda { |r| r.current_step == r.steps[0] }
  second_step = lambda { |r| r.current_step == r.steps[1] }
  third_step  = lambda { |r| r.current_step == r.steps[2] }
  fourth_step = lambda { |r| r.current_step == r.steps[3] }
  fifth_step  = lambda { |r| r.current_step == r.steps[4] }
  sixth_step  = lambda { |r| r.current_step == r.steps[5] }

  # first step validation
  validates :device_id, presence: true, if: first_step

  # second step validation
  validates :model_id, presence: true, if: second_step

  # third step validation
  validates :network_id, presence: true, if: third_step

  # fourth step validation
  validates :problem_id, presence: true, if: fourth_step

  # fourth step validation
  validates :location_id, presence: true, if: fifth_step

  # fifth step validations
  validates :name, length: {in: 1..40 },  presence: true, if: sixth_step
  validates :email, length: {in: 1..100 },  presence: true, if: sixth_step
  validates :phone_number, length: {in: 7..20 }, presence: true, if: sixth_step

  def steps
    %w[ device model network problem location contact ]
  end

  def data_for_step id=nil
    if step?(0)
      Device.all
    elsif step?(1)
      Model.where(device_id: id)
    elsif step?(2)
      Network.all
    elsif step?(3)
      Problem.all
    else
      []
    end
  end

end
