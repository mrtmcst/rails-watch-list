class Movie < ApplicationRecord
  has many :bookmarks

  validates :name, presence: true, uniqueness: true
  validates :overview, presence: true, uniqueness: true

end
