class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5, maximum: 100 }
  validates :body, presence: true, length: { minimum: 10, maximum: 9000 }
  belongs_to :user
  has_many :comments, dependent: :destroy
end
