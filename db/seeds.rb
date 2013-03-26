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
playlist = Playlist.create( {name: "Rustbelt Hip Hop",
                             description:  "A collection of songs from
                             hip hop artists in America's rust belt (Detroit, Pittsburgh, etc)",
                             shared: true,
                             user_id: 1}, :without_protection => true)

playlist = Playlist.create( {name: "Shoegaze Synthpop with Vocals",
                             description:  "Trance roots with a hook",
                             shared: true,
                             user_id: 1}, :without_protection => true)

playlist = Playlist.create( {name: "*LIVE* Big Bangin' Power Ballads *LIVE*",
                             description:  "Concert versions of big, bangin' ballads",
                             shared: true,
                             user_id: 2}, :without_protection => true)


#CREATE SONGS
song = Song.create( url: "http://www.youtube.com/watch?v=dcUGcBFeU_g")

song = Song.create( url: "http://www.youtube.com/watch?v=X0aXbLF_wdk")

song = Song.create( url: "http://www.youtube.com/watch?v=rv66XaNpbLo")

song = Song.create( url: "http://www.youtube.com/watch?v=dX3k_QDnzHE")

song = Song.create( url: "http://www.youtube.com/watch?v=NSf-pYdUDn0")

song = Song.create( url: "http://www.youtube.com/watch?v=Zr_MJAOyOeU")

song = Song.create( url: "http://www.youtube.com/watch?v=4u3StTsVDD0")

song = Song.create( url: "http://www.youtube.com/watch?v=jSsenVv7rF0")

song = Song.create( url: "http://www.youtube.com/watch?v=X_Ur7koy6d0")

#CREATE ITEMS
#song_id = 1
item = Item.create( {song_id:  1,
                     playlist_id: 1,
                     position: 1,
                     title: "Step to the Rear by Formula 412"},
                     :without_protection => true )

item = Item.create( {song_id: 2,
                     playlist_id: 1,
                     position: 2,
                     title: "Just Alright By Skrapz"},
                     :without_protection => true )

item = Item.create( {song_id: 3,
                     playlist_id: 1,
                     position: 3,
                     title: "Cincinnati Cypher"},
                     :without_protection => true )

item = Item.create( {song_id: 4,
                     playlist_id: 2,
                     position: 1,
                     title: "Midnight City by M83"},
                     :without_protection => true )

item = Item.create( {song_id: 5,
                     playlist_id: 2,
                     position: 2,
                     title: "The Night by School of Seven Bells (live)"},
                     :without_protection => true )

item = Item.create( {song_id: 6,
                     playlist_id: 2,
                     position: 3,
                     title: "Sigur Ros - Glosoli "},
                     :without_protection => true )

item = Item.create( {song_id: 7,
                     playlist_id: 3,
                     position: 1,
                     title: "Love Walks In by Van Halen"},
                     :without_protection => true )

item = Item.create( {song_id: 8,
                     playlist_id: 3,
                     position: 2,
                     title: "When Love and Hate Collide - Taylor Swift/Def Leppard"},
                     :without_protection => true )

item = Item.create( {song_id: 9,
                     playlist_id: 3,
                     position: 3,
                     title: "What It Takes by Aerosmith"},
                     :without_protection => true )
