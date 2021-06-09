class Book < ApplicationRecord

  with_options presence: true do
    varidates :title
    varidates :date
  end
end
