require 'faker'

p "erasing everything"
  Client.destroy_all
  BookTransaction.destroy_all
  Review.destroy_all
  Book.destroy_all
  Author.destroy_all
  User.destroy_all
  Review.destroy_all

p "defining variables"

password = "qwerty"
emails = ["linnette@user", "green-dinosaur@user", "dutchness@user", "spaniard@user"]
usernames = ["Linnette", "Green-dinosaur", "Dutchness", "Spaniard"]
genres = ["fantasy", "crime", "historical-fiction", "science-fiction", "horror", "non-fiction"]
book_url = ["https://images.pexels.com/photos/8578/pexels-photo.jpg?h=350&auto=compress&cs=tinysrg", "https://images.pexels.com/photos/458429/pexels-photo-458429.jpeg?h=350&auto=compress&cs=tinysrg", "https://images.pexels.com/photos/237180/pexels-photo-237180.jpeg?h=350&auto=compress&cs=tinysrg", "https://images.pexels.com/photos/39628/woman-gothic-dark-horror-39628.jpeg?h=350&auto=compress&cs=tinysrg"]

p "creating users - 2 of them are authors, all of them are clients"

usernames.each_with_index do |user, index|
  person = User.new(password: password, email: emails[index], username: user)
  Client.create(user: person)
  if index.even?
    person.is_author = true
    person.save
    if user == "Linnette"
      url = "https://pbs.twimg.com/profile_images/573545169569509376/O71ZFKB9_400x400.jpeg"
      user_author = Author.create(user: person, description: Faker::HarryPotter.quote, currency: "eur")
      user_author.remote_profile_picture_url = url
      user_author.save
    else
      url = "https://media.licdn.com/media/AAIA_wDGAAAAAQAAAAAAAAn3AAAAJDU2N2IzYTJkLWY1OWUtNGJmYS05ODdiLTU5ZTgwZmM5ODExMQ.jpg"
      user_author = Author.create(user: person, description: Faker::HarryPotter.quote, currency: "eur")
      user_author.remote_profile_picture_url = url
      user_author.save
    end
  else
    person.save
  end
end

p "creating books"

20.times do
  params = {}
  params[:title] = [Faker::HowIMetYourMother.catch_phrase, Faker::HowIMetYourMother.high_five, Faker::Pokemon.move].sample
  params[:price] = rand(1..75)
  params[:genre] = genres.sample

  params[:publisher] = Faker::ProgrammingLanguage.name
  params[:author] = Author.all.sample
  params[:author_name] = params[:author].user.username
  params[:synopsys] = Faker::StarWars.quote
  book = Book.new(params)
  book.remote_cover_pic_url = book_url.sample
  book.save
end

p "creating bok transactions"

400.times do
  BookTransaction.create(user: User.all.sample, book: Book.all.sample)
end

p "creating reviews"

80.times do
  params = {}
  params[:user] = User.all.sample
  params[:book] = Book.all.sample
  params[:content] = Faker::TheFreshPrinceOfBelAir.quote
  params[:rating] = rand(0..5)
  Review.create(params)
end





