task create_users: :environment do 
  50.times do 
    User.create!({
      name: Faker::Name.name,
      email: Faker::Internet.email,
      github: Faker::Company.bs,
      password: "password",
      admin: false,
      })
  end
end