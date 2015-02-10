task create_iron_yard: :environment do
  1.times do
    Location.create!({
      name: Faker::Company.name,
      address: Faker::Address.street_name,
      city: Faker::Address.city,
      state: Faker::Address.state,
      zip: Faker::Address.zip_code,
      })
  end
  10.times do
    Lesson.create!({
      name: Faker::Company.name,
      description: Faker::Company.catch_phrase,
      })
  end

  10.times do 
    Assignment.create!({
      name: Faker::Company.name,
      due_date: Faker::Date.between(2.days.ago, Date.today)
      })
  end
end