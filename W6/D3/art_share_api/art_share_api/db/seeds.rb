# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

user1 = User.create!(username: 'alan')
user2 = User.create!(username: 'izzi')
user3 = User.create!(username: 'walker')
user4 = User.create!(username: 'joe')

# title, image_url, user_id
artwork1 = Artwork.create!(title: 'the mona lisa', image_url: 'monalisa.com', artist_id: user1.id)
artwork2 = Artwork.create!(title: 'starry night', image_url: 'starrynight.com', artist_id: user2.id)

artworks_share1 = ArtworkShare.create!(artwork_id: artwork1.id, viewer_id: user3.id)
artworks_share2 = ArtworkShare.create!(artwork_id: artwork2.id, viewer_id: user4.id)