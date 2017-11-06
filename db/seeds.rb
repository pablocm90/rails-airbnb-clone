puts 'Creating books...'
100.times do
  Book.create!(
    name: Faker::Company.name,
    tagline: Faker::Company.catch_phrase
  )
end
puts 'Finished!'
