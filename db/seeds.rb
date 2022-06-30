# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(name: "Admin", email: "admin@bro.com", password: "password", confirm_password: "password")
10.times do |x|
  Post.create(title: "Post #{x}", body: "This is the body of post #{x}", user_id: User.first.id)
end