class Contractor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #validates :name, presence: true

  include Gravtastic
  gravtastic
  
  has_many :jobs
  belongs_to :location

  def unfinished_jobs
    jobs.where(finished: false)
  end

  def finished_jobs
    jobs.where(finished: true)
  end

  def pretty_phone_number
    pretty_phone_number = "(#{phone_number[0,3]}) #{phone_number[3,3]}-#{phone_number[6,10]}"
  end
end
