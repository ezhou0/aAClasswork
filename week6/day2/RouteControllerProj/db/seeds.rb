# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(username: 'bob')
user2 = User.create(username: 'cheryl')
user3 = User.create(username: 'miro')
user4 = User.create(username: 'goya')
artwork1 = Artwork.create(title: "blue no 3", img_url: "google.com", artist_id: user3.id)
artwork2 = Artwork.create(title: "the 3rd of may 1808", img_url: "yahoo.com", artist_id: user4.id)
as1 = ArtworkShare.create(artwork_id: artwork1.id, viewer_id: user1.id)
as2 = ArtworkShare.create(artwork_id: artwork1.id, viewer_id: user2.id)
as3 = ArtworkShare.create(artwork_id: artwork2.id, viewer_id: user2.id)


