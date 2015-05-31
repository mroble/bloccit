require 'faker'

unique_post="This is a unique post"
unique_comment="This is a unique comment on a random post"
 
 # Create Posts
 50.times do
   Post.create!(
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph
   )
 end
 posts = Post.all

unless Post.where(title: unique_post).exists?
 Post.create!(
     title:  unique_post,
     body:   "Which contains a unique message"
   )
  end
      
posts = Post.all

# Create Comments

100.times do
   Comment.create!(
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





 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"

