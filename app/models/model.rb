class Model < ActiveRecord::Base
  belongs_to :device
  has_many :jobs
end
