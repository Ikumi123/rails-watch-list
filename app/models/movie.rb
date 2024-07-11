class Movie < ApplicationRecord
  has_many :bookmarks
  has_many :reviews
  has_many :lists, through: :bookmarks
  validates :title, :overview, uniqueness: true
  validates :title, presence: true
  validates :overview, presence: true
end
