require 'faker'

p "erasing author, transactions and books"

  BookTransaction.destroy_all
  Review.destroy_all
  Book.destroy_all
  Author.destroy_all

p "defining users"

@users = User.all

p "defining clients"

@clients = Client.all

p "one client should be an author"

p "the pic and devise are random strings"

url = "https://vignette.wikia.nocookie.net/dbxfanon/images/8/83/Yoshi_Happy_YBA.png/revision/latest/scale-to-width-down/220?cb=20160320065000"
devise = "euros"

@user_author = Author.new(user: @users.first, currency: devise)
@user_author.remote_photo_url = url
@user_author.save

p "let's generate some random books by that author"

10.times do
  params = {}
  params[:title] = Faker::Lorem.word
  params[:price] = rand(1..20)
  params[:genre] = Faker::Lorem.word

  params[:publisher] = Faker::Lovecraft.deity
  params[:author] = @user_author
  params[:synopsys] = Faker::Lovecraft.paragraph(2)
  book = Book.new(params)

  cover_pic = "https://images.pexels.com/photos/279470/pexels-photo-279470.jpeg?w=1260&h=750&auto=compress&cs=tinysrgb"
  book.cover_pic_url = cover_pic
  book.save
end

p "a couple of book transactions to make everything cool"

4.times do
  user = User.all.sample
  book = Book.all.sample
  BookTransaction.create(user: user, book: book)
end

p "all should be here"


