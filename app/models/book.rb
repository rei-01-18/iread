class Book < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  with_options presence: true do
    validates :title
    validates :date
  end
  validates :category_id, numericality: { other_than: 1 }
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 

  has_many :comments, dependent: :destroy
  belongs_to :user
  has_many :liked_users, through: :likes, source: :user
  has_many :likes
end
