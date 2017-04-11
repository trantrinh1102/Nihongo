puts "Create Categories"
10.times do |n|
  Category.create!(
    name: Faker::Name.name,
    description: Faker::Name.name
  )
end
