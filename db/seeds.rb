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
Model.create(name: "3G", device_id: @iphone )
Model.create(name: "3GS", device_id: @iphone )
Model.create(name: "4", device_id: @iphone )
Model.create(name: "4S", device_id: @iphone )
Model.create(name: "5", device_id: @iphone )

# iPad Models
Model.create(name: "1", device_id: @ipad )
Model.create(name: "2", device_id: @ipad )
Model.create(name: "3", device_id: @ipad )
Model.create(name: "4", device_id: @ipad )
Model.create(name: "Mini", device_id: @ipad )

# iPod Models
Model.create(name: "Touch 2", device_id: @ipod )
Model.create(name: "Touch 3", device_id: @ipod )
Model.create(name: "Touch 4", device_id: @ipod )
Model.create(name: "Touch 5", device_id: @ipod )
Model.create(name: "Touch Nano", device_id: @ipod )

# Android Models
Model.create(name: "Samsung Galaxy S2", device_id: @android )
Model.create(name: "Samsung Galaxy S3", device_id: @android )
Model.create(name: "Samsung Galaxy S4", device_id: @android )
Model.create(name: "Google Nexus 4", device_id: @android )
Model.create(name: "Google Nexus", device_id: @android )
Model.create(name: "HTC One X", device_id: @android )
Model.create(name: "HTC One S", device_id: @android )
Model.create(name: "HTC One 4G", device_id: @android )
Model.create(name: "HTC Droid Incredible 2", device_id: @android )
Model.create(name: "HTC Thunderbolt", device_id: @android )
Model.create(name: "Motorola Droid X", device_id: @android )

# Blackberies
Model.create(name: "8100 & 8300", device_id: @blackberry )
Model.create(name: "Curve 9360", device_id: @blackberry )
Model.create(name: "Bold 9700, 9780", device_id: @blackberry )
Model.create(name: "Bold 9900", device_id: @blackberry )
Model.create(name: "8539, 8520, 9300", device_id: @blackberry )
Model.create(name: "9860", device_id: @blackberry )
Model.create(name: "9000", device_id: @blackberry )
Model.create(name: "9380", device_id: @blackberry )
Model.create(name: "9800/9810", device_id: @blackberry )

Problem.create(name: "Broken Screen")
Problem.create(name: "Other")
Problem.create(name: "Not Turning On")
