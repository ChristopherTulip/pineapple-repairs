# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@iphone     = Device.create(name: "iPhone")
@ipod       = Device.create(name: "iPod")
@ipad       = Device.create(name: "iPad")
@android    = Device.create(name: "Android")
@blackberry = Device.create(name: "Blackberry")

# iPhone Models
Model.create(name: "3G", device: @iphone )
Model.create(name: "3GS", device: @iphone )
Model.create(name: "4", device: @iphone )
Model.create(name: "4S", device: @iphone )
Model.create(name: "5", device: @iphone )

# iPad Models
Model.create(name: "1", device: @ipad )
Model.create(name: "2", device: @ipad )
Model.create(name: "3", device: @ipad )
Model.create(name: "4", device: @ipad )
Model.create(name: "Mini", device: @ipad )

# iPod Models
Model.create(name: "Touch 2", device: @ipod )
Model.create(name: "Touch 3", device: @ipod )
Model.create(name: "Touch 4", device: @ipod )
Model.create(name: "Touch 5", device: @ipod )
Model.create(name: "Touch Nano", device: @ipod )

# Android Models
Model.create(name: "Samsung Galaxy S2", device: @android )
Model.create(name: "Samsung Galaxy S3", device: @android )
Model.create(name: "Samsung Galaxy S4", device: @android )
Model.create(name: "Google Nexus 4", device: @android )
Model.create(name: "Google Nexus", device: @android )
Model.create(name: "HTC One X", device: @android )
Model.create(name: "HTC One S", device: @android )
Model.create(name: "HTC One 4G", device: @android )
Model.create(name: "HTC Droid Incredible 2", device: @android )
Model.create(name: "HTC Thunderbolt", device: @android )
Model.create(name: "Motorola Droid X", device: @android )

# Blackberies
Model.create(name: "8100 & 8300", device: @blackberry )
Model.create(name: "Curve 9360", device: @blackberry )
Model.create(name: "Bold 9700, 9780", device: @blackberry )
Model.create(name: "Bold 9900", device: @blackberry )
Model.create(name: "8539, 8520, 9300", device: @blackberry )
Model.create(name: "9860", device: @blackberry )
Model.create(name: "9000", device: @blackberry )
Model.create(name: "9380", device: @blackberry )
Model.create(name: "9800/9810", device: @blackberry )

Problem.create(name: "Broken Screen")
Problem.create(name: "Other")
Problem.create(name: "Not Turning On")
