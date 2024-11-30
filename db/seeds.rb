require 'faker'

# Nettoyage des tables dans l'ordre pour respecter les contraintes de clés étrangères
puts "Cleaning database..."
puts "Cleaning measurements..."
Measurement.destroy_all if Measurement.table_exists?
puts "Cleaning treatments..."
Treatment.destroy_all if Treatment.table_exists?
puts "Cleaning pets..."
Pet.destroy_all if Pet.table_exists?
puts "Cleaning users..."
User.destroy_all if User.table_exists?

puts "Creating users..."

# Création de 5 users
5.times do
  user = User.create!(
    email: Faker::Internet.unique.email,
    password: "password123",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: Faker::Address.full_address
  )
  
  # Création de 3 pets pour chaque user
  3.times do
    pet = Pet.create!(
      name: Faker::Creature::Dog.name,
      specie: Pet::SPECIES.sample,
      breed: Faker::Creature::Dog.breed,
      birth_day: Faker::Date.between(from: 5.years.ago, to: 6.months.ago),
      gender: Pet::GENDERS.sample,
      user: user
    )
    
    # Création de 2-4 treatments pour chaque pet
    rand(2..4).times do
      start_date = Faker::Date.between(from: 1.year.ago, to: Date.today)
      Treatment.create!(
        pet: pet,
        treatment_type: Treatment.treatment_types.keys.sample,
        start_date: start_date,
        end_date: start_date + rand(7..30).days,
        dosage: "#{rand(1..3)} #{['pills', 'ml', 'mg'].sample}",
        frequency: ["Once daily", "Twice daily", "Every 8 hours", "Weekly"].sample,
        notes: Faker::Lorem.sentence,
        renew_date: start_date + rand(30..90).days,
        name: Faker::Science.science
      )
    end
    
    # Création de 3-6 measurements pour chaque pet
    rand(3..6).times do
      measurement_type = Measurement.measurement_types.keys.sample
      value = case measurement_type
              when 'weight'
                rand(2.0..50.0).round(1) # poids en kg
              when 'height'
                rand(20.0..100.0).round(1) # taille en cm
              end
              
      Measurement.create!(
        pet: pet,
        measurement_type: measurement_type,
        value: value,
        date: Faker::Date.between(from: 6.months.ago, to: Date.today),
        notes: Faker::Lorem.sentence
      )
    end
  end
end

puts "Seeds completed! Created:"
puts "- #{User.count} users"
puts "- #{Pet.count} pets"
puts "- #{Treatment.count} treatments"
puts "- #{Measurement.count} measurements"