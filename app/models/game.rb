class Game < ApplicationRecord
  has_many :playergames
  has_many :players, :through => :playergames
end
