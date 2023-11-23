class Event < ApplicationRecord
  belongs_to :user
  has_many :tickets, dependent: :destroy
  has_many_attached :photos
  validates :user_id, :venue, :menu, :cuisine, :price, :description, :capacity, :date, presence: true
  geocoded_by :venue
  after_validation :geocode, if: :will_save_change_to_venue?
end
