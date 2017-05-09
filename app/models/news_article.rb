class NewsArticle < ActiveRecord


  scope :newslist, lambda {order(created_at: :asc).limit(15)}
end
