require 'faker'

p "erasing everything"
  Client.destroy_all
  User.destroy_all
  BookTransaction.destroy_all
  Review.destroy_all
  Book.destroy_all
  Author.destroy_all
  Review.destroy_all

p "defining variables"

password = "qwerty"
emails = ["linnette@user", "green-dinosaur@user", "dutchness@user", "spaniard@user"]
usernames = ["Linnette", "Green-dinosaur", "Dutchness", "Spaniard"]
genres = ["fantasy", "crime", "historical-fiction", "science-fiction", "horror", "non-fiction"]

p "creating users - 2 of them are authors, all of them are clients"

usernames.each_with_index do |user, index|
  person = User.new(pasword: password, email: emails[index], username: user)
  Client.create(user: person)
  if index.even?
    person.is_author = true
    person.save
    if user == "linnette"
      url = "https://pbs.twimg.com/profile_images/573545169569509376/O71ZFKB9_400x400.jpeg"
      user_author = Author.create(user: person, description: Faker::HarryPotter.quote, currency: "eur")
      user_author.remote_profile_picture_url = url
      user_author.save
    else
      url = "https://media.licdn.com/media/AAIA_wDGAAAAAQAAAAAAAAn3AAAAJDU2N2IzYTJkLWY1OWUtNGJmYS05ODdiLTU5ZTgwZmM5ODExMQ.jpg"
      user_author = Author.create(user: person, description: Faker::HarryPotter.quote, currency: "eur")
      user_author.remote_profile_picture_url = url
      user_author.save
  else
    person.save
  end
end






p "defining clients"

@clients = Client.all

p "one client should be an author"

p "the pic and devise are random strings"

url = "https://vignette.wikia.nocookie.net/dbxfanon/images/8/83/Yoshi_Happy_YBA.png/revision/latest/scale-to-width-down/220?cb=20160320065000"
devise = "euros"

@user_author = Author.new(user: @users.first, currency: devise)
@user_author.remote_profile_picture_url = url
@user_author.save

p "let's generate some random books by that author"

10.times do
  params = {}
  params[:title] = Faker::Lorem.word
  params[:price] = rand(1..20)
  params[:genre] = Faker::Lorem.word

  params[:publisher] = Faker::Lovecraft.deity
  params[:author] = @user_author
  params[:author_name] = @user_author.user.username
  params[:synopsys] = Faker::Lovecraft.paragraph(2)
  book = Book.new(params)

  nurl = "https://images.pexels.com/photos/279470/pexels-photo-279470.jpeg?w=1260&h=750&auto=compress&cs=tinysrgb"
  book.remote_cover_pic_url = nurl
  book.save
end

p "a couple of book transactions to make everything cool"

4.times do
  user = User.all.sample
  book = Book.all.sample
  BookTransaction.create(user: user, book: book)
end

p "all should be here"


