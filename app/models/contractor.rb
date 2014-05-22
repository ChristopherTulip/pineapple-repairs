class Contractor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true

  has_many :jobs
  belongs_to :location

  def unfinished_jobs
    jobs.where(finished: false)
  end

  def finished_jobs
    jobs.where(finished: true)
  end
end
