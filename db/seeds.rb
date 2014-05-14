# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Device.create(name: "iPhone")
Device.create(name: "iPod")
Device.create(name: "iPad")
Device.create(name: "Android")

@iphone     = Device.where(name: "iPhone").first
@ipod       = Device.where(name: "iPod").first
@ipad       = Device.where(name: "iPad").first
@android    = Device.where(name: "Android").first

puts "iPhone: #{@iphone.id}"
puts "iPod: #{@ipod.id}"
puts "iPad: #{@ipad.id}"
puts "Android: #{@android.id}"

# iPhone Models
Model.create(name: "iPhone 3G", device_id: @iphone.id )
Model.create(name: "iPhone 3GS", device_id: @iphone.id )
Model.create(name: "iPhone 4", device_id: @iphone.id )
Model.create(name: "iPhone 4S", device_id: @iphone.id )
Model.create(name: "iPhone 5", device_id: @iphone.id )

# iPad Models
Model.create(name: "iPad 1", device_id: @ipad.id )
Model.create(name: "iPad 2", device_id: @ipad.id )
Model.create(name: "iPad 3", device_id: @ipad.id )
Model.create(name: "iPad 4", device_id: @ipad.id )
Model.create(name: "iPad Mini", device_id: @ipad.id )

# iPod Models
Model.create(name: "iPod Touch 2", device_id: @ipod.id )
Model.create(name: "iPod Touch 3", device_id: @ipod.id )
Model.create(name: "iPod Touch 4", device_id: @ipod.id )
Model.create(name: "iPod Touch 5", device_id: @ipod.id )
Model.create(name: "iPod Touch Nano", device_id: @ipod.id )

# Android Models
Model.create(name: "Samsung Galaxy S2", device_id: @android.id )
Model.create(name: "Samsung Galaxy S3", device_id: @android.id )
Model.create(name: "Samsung Galaxy S4", device_id: @android.id )
Model.create(name: "Google Nexus 4", device_id: @android.id )
Model.create(name: "Google Nexus", device_id: @android.id )
Model.create(name: "HTC One X", device_id: @android.id )
Model.create(name: "HTC One S", device_id: @android.id )
Model.create(name: "HTC One 4G", device_id: @android.id )
Model.create(name: "HTC Droid Incredible 2", device_id: @android.id )
Model.create(name: "HTC Thunderbolt", device_id: @android.id )
Model.create(name: "Motorola Droid X", device_id: @android.id )

Problem.create(name: "Broken Screen")
Problem.create(name: "Other")
Problem.create(name: "Not Turning On")
