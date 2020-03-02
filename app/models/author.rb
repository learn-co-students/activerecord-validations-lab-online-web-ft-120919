class Author < ActiveRecord::Base
  #invalid with no name
  validates :name, presence: true
  # invalid when name non-unique
  validates :name, uniqueness: true
  # invalid with a short phone_number
  validates :phone_number, length: { is: 10}

end
