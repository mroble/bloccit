 require 'faker'
 
 # Create Posts
 50.times do
   Post.create!(
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph
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
 
 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"

post_attributes = [
  { title: "Sample Title 1", body: "Sample body 1" },
  { title: "Sample Title 2", body: "Sample body 2" },
  { title: "Sample Title 3", body: "Sample body 3" },
]

post_attributes.each do |attributes|
  Post.where(attributes).first_or_create
end
