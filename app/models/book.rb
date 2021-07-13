class Book < ApplicationRecord

  with_options presence: true do
    validates :title
    validates :date
  end
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_many :liked_users, through: :likes, source: :user
  has_many :likes
end
