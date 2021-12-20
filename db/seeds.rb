# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.find_or_create_by(name: 'first guy')

max_id = Message.last&.id || 0
Message.insert_all((0...10000).map do |i|
  {id: max_id+i+1, user_id: user.id, body: "Message #{max_id+i+1}"}
end)
