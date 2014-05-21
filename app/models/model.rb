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
    pretty_price = (price.to_f / 100).to_s
    cents = pretty_price.to_s[-2, 2]
    dollars = pretty_price[0, pretty_price.length - 3]
    "<span class='currency'>$</span>#{dollars}<span class='cents'>#{cents}</span>"
  end
end
