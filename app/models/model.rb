class Model < ActiveRecord::Base
  belongs_to :device
  has_many :jobs

  def pretty_time
    if time <= 60
      "#{time} mins"
    elsif time < 1440
      "#{time / 60} hours"
    else
      "#{time / 1440 } days"
    end
  end

  def pretty_price
    "$#{(price.to_f / 100)}"
  end
end
