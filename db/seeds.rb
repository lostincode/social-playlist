# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#CREATE USERS
user = User.create( email: "mike@mike.com",
                      password: "mike" )
user.confirm!

user = User.create( email: "bill@bill.com",
                      password: "bill" )
user.confirm!

#CREATE PLAYLISTS
{
  "Rustbelt Hip Hop" => "A collection of songs from hip hop artists in America's rust belt (Detroit, Pittsburgh, etc)",
  "Shoegaze Synthpop with Vocals" => "Trance roots with a hook",
  "Big Bangin' Power Ballads *LIVE*" => "Concert versions of big, bangin' ballads",
  "How to Make a Grilled Cheese Sandwhich" => "Instructional videos for how to make America's lunch.",
  "Commercials for sunglasses" => "I love sunglasses.  Oakley's, Ray Ban's, Vaurnet's.  Here's some of my favorite adverts.",
  "Ruby on Rails Screencasts" => "Great RoR screencasts under 5 minutes."
}.each do |name, desc|
  Playlist.create(
    {
      name: name,
      description:  desc,
      shared: true,
      user: User.all.sample
    },
    :without_protection => true)
end


#CREATE SONGS RUST BELT HIP HOP
%w[
  dcUGcBFeU_g
  X0aXbLF_wdk
  rv66XaNpbLo
  YyXT0Aa30yk
  b9gypvoDNrM
  BWKLuwR_bFw
].each do |yid|
  Song.create( url: "http://www.youtube.com/watch?v=#{yid}")
end

#CREATE SONGS SHOEGAZE
%w[
 dX3k_QDnzHE
 NSf-pYdUDn0
 Zr_MJAOyOeU
].each do |yid|
  Song.create( url: "http://www.youtube.com/watch?v=#{yid}")
end

#CREATE BIG BANGING BALLADS
%w[
 4u3StTsVDD0
 jSsenVv7rF0
 X_Ur7koy6d0
].each do |yid|
  Song.create( url: "http://www.youtube.com/watch?v=#{yid}")
end

#CREATE GRILLED CHEESE
%w[
 BlTCkNkfmRY
 GaxyzK2mHqw
 JE9zwWDnZxY
 RnhgNBTTVMY
].each do |yid|
  Song.create( url: "http://www.youtube.com/watch?v=#{yid}")
end

#CREATE SUNGLASSES
%w[
 CU3VSuAhuqo
 t69V8oHyaz0
 hobw2JKf3m8
 kthYsMv3SHk
 Uqcz1obbMRs
].each do |yid|
  Song.create( url: "http://www.youtube.com/watch?v=#{yid}")
end

#CREATE ROR
%w[
 _GCwR6Urx5Q
 YQM4kpUxUPk
 zGlCLK6yiSM
 OJJr6IAwr30
 3mQjtk2YDkM
 -4vEkpT4kOM
].each do |yid|
  Song.create( url: "http://www.youtube.com/watch?v=#{yid}")
end


#CREATE ITEMS
[
  [1, 1, "Step to the Rear by Formula 412"],
  [1, 2, "Just Alright By Skrapz"],
  [1, 3, "Cincinnati Cypher"],
  [1, 4, "Swagger World Battles Part 2 Week 2 (New Pittsburgh Hip-Hop) 2011"],
  [1, 5, "Pittsburgh Sound by Wiz Khalifa"],
  [1, 6, "Clear Soul Forces - Get No Better"],
#  [1, 6, "abc"],
#  [1, 7, "abc"],
#  [1, 8, "abc"],
#  [1, 9, "abc"],
#  [1, 10, "abc"],
#  [1, 11, "abc"],
#  [1, 12, "abc"],
  [2, 1, "Midnight City by M83"],
  [2, 2, "The Night by School of Seven Bells (live)"],
  [2, 3, "Sigur Ros - Glosoli "],
#  [2, 4, "abc"],
#  [2, 5, "abc"],
#  [2, 6, "abc"],
#  [2, 6, "abc"],
#  [2, 7, "abc"],
#  [2, 8, "abc"],
#  [2, 9, "abc"],
#  [2, 10, "abc"],
#  [2, 11, "abc"],
#  [2, 12, "abc"],
  [3, 1, "Love Walks In by Van Halen"],
  [3, 2, "When Love and Hate Collide - Taylor Swift/Def Leppard"],
  [3, 3, "What It Takes by Aerosmith"],
#  [3, 4, "abc"],
#  [3, 5, "abc"],
#  [3, 6, "abc"],
#  [3, 6, "abc"],
#  [3, 8, "abc"],
#  [3, 9, "abc"],
#  [3, 10, "abc"],
#  [3, 11, "abc"],
#  [3, 12, "abc"],
  [4, 1, "Inside-Out Grilled Cheese Sandwich"],
  [4, 2, "You're Doing It All Wrong : How to Make a Grilled Cheese Sandwich"],
  [4, 3, "How To Make a Fancy Grilled Cheese Sandwich"],
  [4, 4, "Onion and Bacon Grilled Cheese Sandwich"],
#  [4, 5, "abc"],
#  [4, 6, "abc"],
#  [4, 6, "abc"],
#  [4, 7, "abc"],
#  [4, 8, "abc"],
#  [4, 9, "abc"],
#  [4, 10, "abc"],
#  [4, 11, "abc"],
#  [4, 12, "abc"],
  [5, 1, "Ray Ban Commercial"],
  [5, 2, "Shaun White - Oakley Rebellion Commercial"],
  [5, 3, "Gucci Presents: Eyeweb Sunglasses Collection"],
  [5, 4, "LAMONT HOLT - The Timeless Sunglasses"],
  [5, 5, "Panda Bamboo Sunglasses commercial HD"],
#  [5, 6, "abc"],
#  [5, 6, "abc"],
#  [5, 7, "abc"],
#  [5, 8, "abc"],
#  [5, 9, "abc"],
#  [5, 10, "abc"],
#  [5, 11, "abc"],
#  [5, 12, "abc"],
  [6, 1, "Ruby On Rails For Absolute Beginners"],
  [6, 2, "Ruby Programming Tutorial 1 - Getting Started"],
  [6, 3, "Ruby on Rails- Classes- Initialize method"],
  [6, 4, "Ruby on Rails- Classes-Reader-writer methods"],
  [6, 5, "Ruby on Rails: Understanding MVC architecture"],
  [6, 6, "RailsCasts - #179 Seed Data"],
#  [6, 6, "abc"],
#  [6, 7, "abc"],
#  [6, 8, "abc"],
#  [6, 9, "abc"],
#  [6, 10, "abc"],
#  [6, 11, "abc"],
#  [6, 12, "abc"]
].each_with_index do |item, index|
  playlist_id = item.first
  position_id = item[1]
  title = item[2]
  Item.create(
      {
        song_id: index+1,
        # song: Song.find_by_id(index) || Song.all.sample,
        playlist_id: playlist_id,
        position: position_id,
        title: title
      },
      :without_protection => true)
  end
