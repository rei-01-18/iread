class Book < ApplicationRecord

  with_options presence: true do
    validates :title
    validates :date
  end
end
