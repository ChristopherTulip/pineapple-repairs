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
  validates :device_id, presence: true, if: second_step

  # second step validation
  validates :model_id, presence: true, if: third_step

  # third step validation
  validates :network_id, presence: true, if: fourth_step

  # fourth step validation
  validates :problem_id, presence: true, if: fifth_step

  # fourth step validation
  validates :location_id, presence: true, if: first_step

  # fifth step validations
  validates :name, length: {in: 1..40 },  presence: true, if: sixth_step
  validates :email, length: {in: 1..100 },  presence: true, if: sixth_step
  validates :phone_number, length: {in: 7..20 }, presence: true, if: sixth_step

  scope :available, -> { where(contractor_id: nil) }

  def steps
    %w[ location device model network problem contact ]
  end

  def data_for_step id=nil
    if current_step == "device"
      Device.all
    elsif current_step == "model"
      Model.where(device_id: id)
    elsif current_step == "network"
      Network.all
    elsif current_step == "problem"
      Problem.all
    else
      []
    end
  end

  def pretty_phone_number
    pretty_phone_number = "(#{phone_number[0,3]}) #{phone_number[3,3]}-#{phone_number[6,10]}"
  end

end
