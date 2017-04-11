puts "Create Categories"
10.times do |n|
  c = Category.create!(
    name: Faker::Name.name,
    description: Faker::Name.name
  )
  5.times do |n|
    Lesson.create!(
      name: Faker::Name.name,
      description: Faker::Name.name,
      category_id: c.id
    )
  end
end
