class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  validates :name, presence: true, uniqueness: true
  has_many :reviews, dependent: :destroy
  has_one_attached :photo
  validates :image_url, presence: true, unless: -> { photo.present? }
  validates :photo, presence: true, unless: -> { image_url.present? }
end
