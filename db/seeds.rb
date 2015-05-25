post_attributes = [
  { title: "Sample Title 1", body: "Sample body 1" },
  { title: "Sample Title 2", body: "Sample body 2" },
  { title: "Sample Title 3", body: "Sample body 3" },
]

post_attributes.each do |attributes|
  Post.where(attributes).first_or_create
end