# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Vet.create!([
  { first_name: 'Emma', last_name: 'Smith', email: 'emma.smith@example.com', phone: '555-123-4567' },
  { first_name: 'Liam', last_name: 'Johnson', email: 'liam.johnson@example.com', phone: '555-234-5678' },
  { first_name: 'Olivia', last_name: 'Brown', email: 'olivia.brown@example.com', phone: '555-345-6789' },
  { first_name: 'Noah', last_name: 'Williams', email: 'noah.williams@example.com', phone: '555-456-7890' },
  { first_name: 'Ava', last_name: 'Jones', email: 'ava.jones@example.com', phone: '555-567-8901' },
  { first_name: 'Elijah', last_name: 'Garcia', email: 'elijah.garcia@example.com', phone: '555-678-9012' },
  { first_name: 'Sophia', last_name: 'Miller', email: 'sophia.miller@example.com', phone: '555-789-0123' },
  { first_name: 'James', last_name: 'Martinez', email: 'james.martinez@example.com', phone: '555-890-1234' },
  { first_name: 'Isabella', last_name: 'Davis', email: 'isabella.davis@example.com', phone: '555-901-2345' },
  { first_name: 'Benjamin', last_name: 'Hernandez', email: 'benjamin.hernandez@example.com', phone: '555-012-3456' }
])
