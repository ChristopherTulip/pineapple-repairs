class Problem < ActiveRecord::Base
  has_many :jobs

  has_attached_file :avatar,
                    :styles => { :medium => "150x150>", :thumb => "100x100>" },
                    :default_url => "/images/missing.png"

  validates_attachment  :avatar, presence: true,
                        file_name: { :matches => [/png\Z/, /jpe?g\Z/] },
                        size: { in: 0..1.megabytes },
                        content_type: { :content_type => /\Aimage\/.*\Z/ }

  validates :name, presence: true
end
