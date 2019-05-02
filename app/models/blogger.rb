class Blogger < ApplicationRecord
  has_many :posts
  has_many :destinations, through: :posts

  validates_presence_of :name, :age, :bio
  validates :name, uniqueness: true
  validates :age, numericality: { greater_than: 0 }
  validates :bio, length: { minimum: 30 }

end
