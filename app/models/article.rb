class Article < ApplicationRecord
  validates :title, presence: true, length: {maximum:18}, uniqueness: true
  has_many :comments
end
