# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Device.create(name: "Phone")
Device.create(name: "iPod")
Device.create(name: "iPad")

@phone      = Device.where(name: "Phone").first
@ipod       = Device.where(name: "iPod").first
@ipad       = Device.where(name: "iPad").first

puts "iPhone: #{@phone.id}"
puts "iPod: #{@ipod.id}"
puts "iPad: #{@ipad.id}"

# Phone Models
Model.create(name: "iPhone 3g", price: 3999, time: 15, device: @phone )
Model.create(name: "iPhone 3gs", price: 3999, time: 15, device: @phone )
Model.create(name: "iPhone 4", price: 6999, time: 45, device: @phone )
Model.create(name: "iPhone 4s", price: 6999, time: 45, device: @phone )
Model.create(name: "iPhone 5", price: 12999, time: 15, device: @phone )
Model.create(name: "iPhone 5c", price: 17999, time: 15, device: @phone )
Model.create(name: "iPhone 5s", price: 17999, time: 15, device: @phone )
Model.create(name: "Samsung Galaxy S3", price: 14999, time: 60, device: @phone )
Model.create(name: "Samsung Galaxy S4", price: 17999, time: 60, device: @phone )
Model.create(name: "Google Nexus 4", price: 17999, time: 60, device: @phone )
Model.create(name: "Google Nexus 5", price: 22999, time: 60, device: @phone )

# iPad Models
Model.create(name: "iPad 1", price: 10999, time: 1440, device: @ipad )
Model.create(name: "iPad 2", price: 12999, time: 1440, device: @ipad )
Model.create(name: "iPad 3", price: 13999, time: 1440, device: @ipad )
Model.create(name: "iPad 4", price: 14999, time: 1440, device: @ipad )
Model.create(name: "iPad Air", price: 15999, time: 1440, device: @ipad )
Model.create(name: "iPad Mini", price: 14999, time: 1440, device: @ipad )
Model.create(name: "iPad Mini Retina", price: 19999, time: 1440, device: @ipad )

# iPod Models
Model.create(name: "2th Generation iPod", price: 4999, time: 60, device: @ipod )
Model.create(name: "3rd Generation iPod", price: 4999, time: 60, device: @ipod )
Model.create(name: "4th Generation iPod", price: 5999, time: 60, device: @ipod )
Model.create(name: "5th Generation iPod", price: 14999, time: 60, device: @ipod )

Problem.create(name: "Broken Screen")
Problem.create(name: "Other")
Problem.create(name: "Not Turning On")

Network.create(name: "AT&T")
Network.create(name: "Koodo")
Network.create(name: "Telus")

Location.create(city: "vancouver", country: "cananda")
