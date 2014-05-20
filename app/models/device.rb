class Device < ActiveRecord::Base
  has_many :jobs
  has_many :models
end
