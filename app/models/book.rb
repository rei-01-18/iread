class Book < ApplicationRecord

  with_options presence: true do
    validates :title
    validates :date
  end
  has_many :comments 
  belongs_to :user
end
