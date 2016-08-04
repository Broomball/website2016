class NewsArticle < ActiveRecord::Base


  scope :newslist, lambda {order(created_at: :asc).limit(15)}
end
