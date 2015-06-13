class Topic < ActiveRecord::Base
  has_many :posts
  has_many :summaries, :through => :post
  
end
