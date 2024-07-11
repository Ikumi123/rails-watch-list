class Bookmark < ApplicationRecord
  belongs_to :list
  belongs_to :movie
  validates :movie_id, uniqueness: {scope: :list_id, message: "Must be unique per list"}
  validates :comment, length: {minimum: 6}
  validates :comment, presence: true
end
