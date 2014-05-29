class Model < ActiveRecord::Base
  belongs_to :device
  has_many :jobs

  has_attached_file :avatar,
                    :styles => { :medium => "150x150>",
                    :thumb => "100x100>" },
                    :default_url => "/images/missing.png"


  validates_attachment  :avatar, presence: true,
                        file_name: { :matches => [/png\Z/, /jpe?g\Z/] },
                        size: { in: 0..1.megabytes },
                        content_type: { :content_type => /\Aimage\/.*\Z/ }


  validates :name, presence: true
  validates :price, presence: true
  validates :time, presence: true
  validates :device_id, presence: true

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
