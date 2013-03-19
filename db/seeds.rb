# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin_user = User.create({:email => "mike@mike.com",
                          :password => "mike"})

playlist = Playlist.create({ name: "Mike's Winter Jams" },
                            { name: "Mike's Smooth Jazz" })

admin_user = User.create({:email => "bill@bill.com",
                          :password => "bill"})

playlist = Playlist.create({ name: "Bill's Summer Beats" },
                            { name: "Bill's Romantic Relaxer Tunes" })
