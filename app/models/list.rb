class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks

  before_destroy :check_for_bookmarks

  validates :name, presence: true, uniqueness: true

  private

  def check_for_bookmarks
    if bookmarks.exists?
      error.add(:base, 'Cannot delete movie with existing bookmarks')
      throw :abort
    end
  end
end
