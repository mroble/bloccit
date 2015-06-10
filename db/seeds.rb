require 'faker'

 # Create Users
 5.times do
   user = User.new(
     name:     Faker::Name.name,
     email:    Faker::Internet.email,
     password: Faker::Lorem.characters(10)
   )
   user.skip_confirmation!
   user.save!
 end
 users = User.all
 
 # Note: by calling `User.new` instead of `create`,
 # we create an instance of User which isn't immediately saved to the database.
 
 # The `skip_confirmation!` method sets the `confirmed_at` attribute
 # to avoid triggering an confirmation email when the User is saved.
 
 # The `save` method then saves this User to the database.


unique_post="This is a unique post"
unique_comment="This is a unique comment on a random post"
 
 # Create Posts
 50.times do
   Post.create!(
     user:   users.sample,
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph
   )
 end
 posts = Post.all

unless Post.where(title: unique_post).exists?
 Post.create!(
     title:  unique_post,
     body:   "Which contains a unique message",
     user: users.sample
   )
  end
      
posts = Post.all

# Create Comments

100.times do
   Comment.create!(
       # user: users.sample,   # we have not yet associated Users with Comments
     post: posts.sample,
     body: Faker::Lorem.paragraph
   )
 end

unless Comment.where(body: unique_comment).exists?
  Comment.create!(
     post:  posts.sample,
     body:  unique_comment
   )
end

#Create ad
34.times do
Advertisement.create!(
     title:  "Awesome Ads",
     copy:   "Which are so flippin' awesome!",
     price:  2
  )
  end

advertisements = Advertisement.all

#Create questions
37.times do
Question.create!(
     title:  "Questions?",
     body:   "What is the meaning of life?",  
  )
  end

questions = Question.all



 user = User.first
 user.skip_reconfirmation!
 user.update_attributes!(
   email: 'moroble@gmail.com',
   password: 'helloworld'
 )

admin = User.new(
  name: 'Admin User',
  email: 'admin@example.com',
  password: 'helloworld',
  password_confirmation: 'helloworld')
  admin.skip_confirmation!
  admin.save
  admin.update_attribute(:role, 'admin')



 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"

