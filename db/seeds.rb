# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user = User.find_or_create_by!(email: 'fannyevepl@gmail.com') do |user|
  user.password = 'password' # Ensure this matches your Devise password requirements
  user.password_confirmation = 'password'
end

Pet.create([
  { name: 'Padme', breed: 'Golden Retriever', birth_day: '2020-01-01', gender: 'Male', user: user },
  { name: 'Vandal', breed: 'Siamese', birth_day: '2019-05-15', gender: 'Female', user: user },
  { name: 'Valentino', breed: 'Beagle', birth_day: '2021-07-20', gender: 'Male', user: user }
])
