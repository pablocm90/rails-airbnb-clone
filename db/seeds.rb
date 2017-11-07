require 'faker'

p "erasing author, transactions and books"

  BookTransaction.destroy_all
  Book.destroy_all
  Author.destroy_all


p "defining users"

@users = User.all

p "defining clients"

@clients = Client.all

p "one client should be an author"

p "the pic and devise are random strings"

picture = "randomstring"
devise = "euros"

@user_author = Author.create(user: @users.first, profile_picture: picture, currency: devise)

p "let's generate some random books by that author"

10.times do
  params = {}
  params[:title] = Faker::Lorem.word
  params[:price] = rand(1..20)
  params[:genre] = Faker::Lorem.word
  params[:cover_pic] = "anotherrandomstring"
  params[:publisher] = Faker::Lovecraft.deity
  params[:author] = @user_author
  params[:synopsys] = Faker::Lovecraft.paragraph(2)
  Book.create(params)
end

p "a couple of book transactions to make everything cool"

4.times do
  user = User.all.sample
  book = Book.all.sample
  BookTransaction.create(user: user, book: book)
end

p "all should be here"

