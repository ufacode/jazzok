# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.destroy_all
Category.create([
                    {name: 'Музыка', uri: 'music'},
                    {name: 'Рецензия', uri: 'review'},
                    {name: 'Кино', uri: 'movie'}
                ])
User.destroy_all
User.create!([
                {name: 'MpaK', email: 'renat@aomega.co', password: 'pas100500' }
            ])

user = User.last
user.confirm!

Post.destroy_all
100.times do
  Post.create(
      title:   Faker::Lorem.sentence( rand(5..10) ),
      content: Faker::Lorem.sentence( rand(300..1000) ),
      user:  user
  )
end

