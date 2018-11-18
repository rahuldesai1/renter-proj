# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[['rahul', 5.5], ['carolyn', 42], ['kelvin', 37.25], ['sophia', 1000], ['anjali', 50]].each do |name, balance|
  User.create(
  	username: name,
    email: name+'@renter.com',
    password: 'password',
    balance: balance,
  )
end

[['Laptop', 20, User.find_by(username: 'rahul').id, false], ['Car', 102.20, User.find_by(username: 'carolyn').id, false], ['Cup', 2, User.find_by(username: 'kelvin').id, true], ['Textbook', 10.5, User.find_by(username: 'sophia').id, true], ['Basketball', 12, User.find_by(username: 'anjali').id, true]].each do |name, price, user, status|
  Product.create(
    name: name,
    description: 'This ' + name + ' is available for renting',
    owner_id: user,
    available: status,
    price: price,
  )
end

[[User.find_by(username: 'kelvin').id, User.find_by(username: 'rahul').id, Product.find_by(name: 'Laptop').id, Date.new(2019,2,3), true], [User.find_by(username: 'anjali').id, User.find_by(username: 'carolyn').id, Product.find_by(name: 'Car').id, Date.new(2018,10,10), false]].each do |seller, renter, product, date, status|
  Transaction.create(
    seller_id: seller,
    renter_id: renter,
    product_id: product,
    duration: date,
    status: status,
  )
end

[[5, User.find_by(username: 'rahul').id, Product.find_by(name: 'Laptop').id], [3, User.find_by(username: 'carolyn').id, Product.find_by(name: 'Car').id]].each do |rating, user, product|
  Review.create(
    rating: rating,
    comment: 'This is a great' +  Product.find(product).name + '!',
    user_id: user,
    product_id: product,
  )
end
