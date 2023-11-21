class Event < ApplicationRecord
  belongs_to :user
  has_many :tickets
  validates :user_id, :venue, :menu, :cuisine, :price, :description, :capacity, :date, presence: true
end
