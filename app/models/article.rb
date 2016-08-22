class Article < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :title, :body, :price, presence: true
end
